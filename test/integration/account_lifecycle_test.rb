require "test_helper"

# Pendaftaran mandiri yang bisa ditutup, akun yang bisa dinonaktifkan atau
# dihapus, dan aturan kaprodi wajib punya prodi.
class AccountLifecycleTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:budi)
    @admin.roles << roles(:admin)
    @admin.update!(active_role: roles(:admin))
  end

  def sign_up_params(email = "orang.baru@example.com")
    { user: { full_name: "Orang Baru", email: email, password: "rahasia-kuat-1", password_confirmation: "rahasia-kuat-1" } }
  end

  def stranger
    user = User.create!(full_name: "Orang Asing", email: "asing@example.com", password: "rahasia-kuat-1", confirmed_at: Time.current)
    user.roles << roles(:mahasiswa)
    user
  end

  test "tanpa pengaturan, pendaftaran tetap terbuka untuk instalasi lama" do
    assert AppSetting.registration_open?
    get new_user_registration_path
    assert_response :success
    assert_difference("User.count", 1) { post user_registration_path, params: sign_up_params }
  end

  test "admin menutup pendaftaran: form, kiriman, dan tautan Daftar tertutup" do
    sign_in @admin
    get admin_users_path
    assert_select "[data-testid=registration-setting]", text: /Terbuka/

    patch registration_admin_users_path, params: { open: false }
    assert_redirected_to admin_users_path
    assert_not AppSetting.registration_open?
    assert_equal @admin, AppSetting.find_by(key: AppSetting::REGISTRATION_KEY).updated_by
    sign_out @admin

    get new_user_registration_path
    assert_redirected_to new_user_session_path
    assert_no_difference("User.count") { post user_registration_path, params: sign_up_params }
    assert_redirected_to new_user_session_path

    get new_user_session_path
    assert_select "a[href=?]", new_user_registration_path, count: 0
    get root_path
    assert_select "a[href=?]", new_user_registration_path, count: 0
  end

  test "pendaftaran tertutup: akun Google baru ditolak, yang sudah ada tetap masuk" do
    AppSetting.set_registration_open!(false, by: @admin)
    auth = Struct.new(:provider, :uid, :info).new("google_oauth2", "g-1", Struct.new(:email, :name).new("g@example.com", "G"))

    assert_nil User.from_google_omniauth(auth)
    assert_not User.exists?(uid: "g-1")

    existing = User.create!(full_name: "G", email: "g@example.com", password: "rahasia-kuat-1", confirmed_at: Time.current,
                            provider: "google_oauth2", uid: "g-1")
    assert_equal existing, User.from_google_omniauth(auth)
  end

  test "bukan admin tidak dapat mengubah pendaftaran maupun status akun" do
    asing = stranger
    sign_in users(:dedi)
    patch registration_admin_users_path, params: { open: false }
    assert_redirected_to dashboard_path
    assert AppSetting.registration_open?

    patch deactivate_admin_user_path(users(:siti))
    assert_redirected_to dashboard_path
    assert_not users(:siti).reload.deactivated?

    assert_no_difference("User.count") { delete admin_user_path(asing) }
  end

  test "akun nonaktif tidak bisa masuk dan sesi berjalan terputus, lalu pulih bila diaktifkan lagi" do
    siti = users(:siti)
    sign_in siti
    get dashboard_path
    assert_response :success

    siti.update_column(:deactivated_at, Time.current)
    get dashboard_path
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_match "dinonaktifkan", response.body

    post user_session_path, params: { user: { email: siti.email, password: "password123" } }
    assert_no_match "Berhasil masuk", flash.to_h.values.join

    siti.update_column(:deactivated_at, nil)
    assert siti.reload.active_for_authentication?
  end

  test "admin menonaktifkan dan mengaktifkan kembali; akunnya sendiri ditolak" do
    sign_in @admin
    siti = users(:siti)
    patch deactivate_admin_user_path(siti)
    assert_redirected_to edit_admin_user_path(siti)
    assert siti.reload.deactivated?

    get admin_users_path
    assert_match "Nonaktif", response.body
    get edit_admin_user_path(siti)
    assert_select "[data-testid=account-status] button", text: "Aktifkan Kembali"

    patch reactivate_admin_user_path(siti)
    assert_not siti.reload.deactivated?

    patch deactivate_admin_user_path(@admin)
    assert_not @admin.reload.deactivated?
    assert_match "tidak dapat dinonaktifkan", flash[:alert]
    assert_no_difference("User.count") { delete admin_user_path(@admin) }
  end

  test "hapus permanen hanya untuk akun tanpa rekam jejak" do
    sign_in @admin
    asing = stranger
    Notification.create!(recipient: asing, title: "Selamat datang")
    assert asing.deletable?
    get edit_admin_user_path(asing)
    assert_select "[data-testid=account-status] button", text: "Hapus Akun"

    assert_difference("User.count", -1) { delete admin_user_path(asing) }
    assert_redirected_to admin_users_path

    siti = users(:siti)
    assert_not siti.deletable?, "siti punya kegiatan dan kasus"
    get edit_admin_user_path(siti)
    assert_select "[data-testid=account-status] button", text: "Hapus Akun", count: 0
    assert_no_difference(-> { User.count }) { delete admin_user_path(siti) }
    assert_match "rekam jejak", flash[:alert]
    assert_equal 2, siti.clinical_cases.count, "rekam jejak tidak boleh ikut terhapus"
  end

  test "akun nonaktif keluar dari daftar pilihan, hitungan prodi, dan feed kalender" do
    siti = users(:siti)
    token = siti.calendar_feed_token!
    get activity_logs_feed_path(token: token)
    assert_response :success

    siti.update_column(:deactivated_at, Time.current)
    get activity_logs_feed_path(token: token)
    assert_response :not_found

    sign_in @admin
    get new_clinical_rotation_path
    assert_select "select[name='clinical_rotation[user_id]'] option", text: siti.full_name, count: 0
    get analytics_path(study_program_id: study_programs(:sarjana_kedokteran).id)
    assert_no_match siti.email, response.body

    assert_not_includes User.case_supervisors, siti
  end

  test "impor menolak kaprodi tanpa prodi, kecuali juga admin atau prodinya sudah ada" do
    sign_in @admin
    csv = "email,nama,peran,prodi\n" \
          "kaprodi.a@example.com,Kaprodi A,kaprodi,\n" \
          "kaprodi.b@example.com,Kaprodi B,kaprodi,pspd\n" \
          "kaprodi.c@example.com,Kaprodi C,kaprodi+admin,\n" \
          "dedi@example.com,Dedi Kaprodi,kaprodi,\n"
    file = Rack::Test::UploadedFile.new(StringIO.new(csv), "text/csv", original_filename: "pengguna.csv")
    post import_admin_users_path, params: { file: file }

    assert_response :success
    assert_match "Baris 2: kaprodi wajib punya prodi", response.body
    assert_not User.exists?(email: "kaprodi.a@example.com")
    assert User.exists?(email: "kaprodi.b@example.com")
    assert User.exists?(email: "kaprodi.c@example.com")
    assert_equal study_programs(:sarjana_kedokteran), users(:dedi).reload.study_program
  end

  test "contoh format impor mengisi prodi kaprodi" do
    sign_in @admin
    get import_admin_users_path
    assert_match "kaprodi,pspd", response.body
  end

  test "Sunting menolak kaprodi tanpa prodi" do
    sign_in @admin
    siti = users(:siti)
    patch admin_user_path(siti), params: { user: { full_name: siti.full_name, study_program_id: "", role_ids: [ roles(:kaprodi).id ] } }

    assert_response :unprocessable_entity
    assert_match "wajib punya Program Studi", response.body
    assert_equal study_programs(:sarjana_kedokteran), siti.reload.study_program
    assert_equal [ "mahasiswa" ], siti.roles.pluck(:code)

    patch admin_user_path(siti), params: { user: { full_name: siti.full_name, study_program_id: "", role_ids: [ roles(:kaprodi).id, roles(:admin).id ] } }
    assert_redirected_to admin_users_path
  end
end
