require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:budi)
    @admin.roles << roles(:admin)
  end

  test "bukan admin ditolak" do
    sign_in users(:dedi)
    get admin_users_path
    assert_redirected_to dashboard_path
  end

  test "admin melihat daftar dan menyaring per peran" do
    sign_in @admin
    get admin_users_path(role: "mahasiswa")

    assert_response :success
    assert_match users(:siti).full_name, response.body
    assert_no_match users(:wati).full_name, response.body
  end

  test "admin mengubah peran dan prodi pengguna; peran aktif ikut disesuaikan" do
    sign_in @admin
    siti = users(:siti)

    patch admin_user_path(siti), params: {
      user: { full_name: "Siti M.", study_program_id: study_programs(:profesi_dokter).id, role_ids: [ roles(:dosen).id ] }
    }
    assert_redirected_to admin_users_path

    siti.reload
    assert_equal "Siti M.", siti.full_name
    assert_equal [ "dosen" ], siti.roles.pluck(:code)
    assert_equal roles(:dosen), siti.active_role
    assert_equal study_programs(:profesi_dokter), siti.study_program
  end

  test "pengguna tanpa peran ditolak" do
    sign_in @admin
    patch admin_user_path(users(:siti)), params: { user: { full_name: "Siti", role_ids: [] } }
    assert_response :unprocessable_entity
    assert_equal [ "mahasiswa" ], users(:siti).reload.roles.pluck(:code)
  end

  test "reset kata sandi membuat kata sandi sementara acak yang ditampilkan sekali dan wajib diganti" do
    sign_in @admin
    patch reset_password_admin_user_path(users(:siti))
    assert_redirected_to edit_admin_user_path(users(:siti))

    temporary = flash[:temporary_password]
    assert_match(/\A[a-zA-Z2-9]{4}-[a-zA-Z2-9]{4}-[a-zA-Z2-9]{4}\z/, temporary)
    siti = users(:siti).reload
    assert siti.valid_password?(temporary)
    assert_not siti.valid_password?(User::LEGACY_DEFAULT_PASSWORD)
    assert siti.must_change_password?

    follow_redirect!
    assert_select '[data-testid="temporary-password"]', /#{Regexp.escape(temporary)}/
    get edit_admin_user_path(siti)
    assert_select '[data-testid="temporary-password"]', 0
  end

  test "reset kata sandi oleh admin membuka kunci akun yang terkunci" do
    siti = users(:siti)
    siti.lock_access!(send_instructions: false)
    sign_in @admin

    get edit_admin_user_path(siti)
    assert_select '[data-testid="account-locked"]'

    patch reset_password_admin_user_path(siti)
    assert_not siti.reload.access_locked?
    assert_equal 0, siti.failed_attempts
  end

  test "reset kata sandi oleh admin ikut mengonfirmasi email yang belum terkonfirmasi" do
    siti = users(:siti)
    siti.update_columns(confirmed_at: nil)
    sign_in @admin

    patch reset_password_admin_user_path(siti)

    assert siti.reload.confirmed?
    assert siti.active_for_authentication?
  end

  test "admin mengonfirmasi email pengguna secara manual" do
    siti = users(:siti)
    siti.update_columns(confirmed_at: nil)
    sign_in @admin

    get edit_admin_user_path(siti)
    assert_match "Belum terkonfirmasi", response.body

    patch confirm_email_admin_user_path(siti)
    assert_redirected_to edit_admin_user_path(siti)
    assert siti.reload.confirmed?
  end

  test "impor CSV membuat akun baru, memperbarui yang ada, dan melaporkan baris gagal" do
    sign_in @admin

    assert_difference "User.count", 2 do
      post import_admin_users_path, params: { file: fixture_file_upload("users_import.csv", "text/csv") }
    end
    assert_response :success

    baru = User.find_by!(email: "baru1@example.com")
    assert_equal [ "mahasiswa" ], baru.roles.pluck(:code)
    assert_equal study_programs(:sarjana_kedokteran), baru.study_program
    assert baru.confirmed?
    assert baru.must_change_password?
    assert_not baru.valid_password?(User::LEGACY_DEFAULT_PASSWORD)
    temporary = css_select('[data-testid="import-credentials"] tr').map { |tr| tr.css("td").map(&:text) }
                                                                  .find { |cells| cells.first == "baru1@example.com" }&.last
    assert temporary.present?, "kata sandi sementara akun baru harus ditampilkan di hasil impor"
    assert baru.valid_password?(temporary)

    dosen = User.find_by!(email: "dr.baru@example.com")
    assert_equal %w[dosen preseptor].sort, dosen.roles.pluck(:code).sort
    assert_equal study_programs(:profesi_dokter), dosen.study_program

    assert_equal "Siti Mahasiswa Diperbarui", users(:siti).reload.full_name
    assert_match "Baris 5", response.body
    assert_match "raja", response.body
  end

  test "impor tanpa berkas ditolak dengan pesan" do
    sign_in @admin
    post import_admin_users_path
    assert_redirected_to import_admin_users_path
  end
end
