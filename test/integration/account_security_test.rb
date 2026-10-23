require "test_helper"

# Pengerasan login: kata sandi bawaan lama dipaksa ganti, kata sandi sementara
# wajib diganti, penguncian akun, panjang minimal, dan pembatasan laju.
class AccountSecurityTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def login(email, password)
    post user_session_path, params: { user: { email: email, password: password } }
  end

  test "masuk dengan kata sandi bawaan publik memaksa ganti kata sandi sebelum membuka halaman lain" do
    login(users(:siti).email, User::LEGACY_DEFAULT_PASSWORD)
    assert users(:siti).reload.must_change_password?

    get dashboard_path
    assert_redirected_to edit_user_registration_path
    follow_redirect!
    assert_select '[data-testid="must-change-password"]'

    # Keluar tetap bisa (controller Devise tidak terkena filter).
    delete destroy_user_session_path
    assert_response :redirect
    get dashboard_path
    assert_redirected_to new_user_session_path
  end

  test "mengganti kata sandi melepas kewajiban ganti dan membuka aplikasi lagi" do
    siti = users(:siti)
    siti.update_columns(must_change_password: true)
    sign_in siti

    put user_registration_path, params: { user: { email: siti.email, password: "rahasia-baru-99", password_confirmation: "rahasia-baru-99",
                                                  current_password: User::LEGACY_DEFAULT_PASSWORD } }
    assert_response :redirect
    assert_not siti.reload.must_change_password?
    assert siti.valid_password?("rahasia-baru-99")

    get dashboard_path
    assert_response :success
  end

  test "selama wajib ganti, menyimpan Pengaturan Akun tanpa kata sandi baru ditolak" do
    siti = users(:siti)
    siti.update_columns(must_change_password: true)
    sign_in siti

    put user_registration_path, params: { user: { email: siti.email, current_password: User::LEGACY_DEFAULT_PASSWORD } }
    assert_response :unprocessable_content
    assert_match "wajib diisi", response.body
    assert siti.reload.must_change_password?
  end

  test "kata sandi bawaan publik tidak bisa dipilih lagi, kecuali akun demo" do
    user = users(:siti)
    user.password = user.password_confirmation = User::LEGACY_DEFAULT_PASSWORD
    assert_not user.valid?
    assert user.errors[:password].any?

    demo = User.new(full_name: "Demo", email: "x.demo@#{User::DEMO_EMAIL_DOMAIN}", password: User::LEGACY_DEFAULT_PASSWORD)
    demo.valid?
    assert_empty demo.errors[:password]
  end

  test "akun demo berkata sandi publik tidak dipaksa ganti" do
    demo = User.create!(full_name: "Demo", email: "mhs.demo@#{User::DEMO_EMAIL_DOMAIN}", password: User::LEGACY_DEFAULT_PASSWORD,
                        confirmed_at: Time.current, roles: [ roles(:mahasiswa) ], active_role: roles(:mahasiswa))
    login(demo.email, User::LEGACY_DEFAULT_PASSWORD)
    assert_not demo.reload.must_change_password?
    get dashboard_path
    assert_response :success
  end

  test "kata sandi sementara acak dan sekali pakai: wajib ganti sampai diganti sendiri" do
    user = users(:wati)
    temporary = user.assign_temporary_password
    user.save!
    assert user.reload.must_change_password?
    assert user.valid_password?(temporary)
    assert_not_equal temporary, User.generate_temporary_password
  end

  test "akun terkunci setelah 10 kali salah kata sandi, lalu kata sandi benar pun ditolak" do
    User.maximum_attempts.times { login(users(:wati).email, "salah-terus-1") }
    assert users(:wati).reload.access_locked?

    login(users(:wati).email, User::LEGACY_DEFAULT_PASSWORD)
    assert_match "terkunci", flash[:alert].to_s
    get dashboard_path
    assert_redirected_to new_user_session_path
  end

  test "kunci terbuka sendiri setelah unlock_in berlalu" do
    users(:wati).lock_access!(send_instructions: false)
    travel User.unlock_in + 1.minute do
      assert_not users(:wati).reload.access_locked?
    end
  end

  test "kata sandi minimal 8 karakter" do
    assert_equal 8, Devise.password_length.min
    user = User.new(full_name: "Pendek", email: "pendek@example.com", password: "abc1234")
    assert_not user.valid?
    assert user.errors[:password].any?
  end

  test "sesi tanpa Ingat saya berakhir setelah 2 jam tidak aktif" do
    assert_equal 2.hours, User.timeout_in
  end
end

class RackAttackTest < ActionDispatch::IntegrationTest
  setup do
    Rack::Attack.enabled = true
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  end

  teardown do
    Rack::Attack.enabled = false
  end

  test "tebakan login beruntun ke satu email dibatasi dengan 429" do
    statuses = 11.times.map do |i|
      post user_session_path, params: { user: { email: "korban@example.com", password: "tebakan-#{i}" } }
      response.status
    end
    assert_equal 10, statuses.count(422)
    assert_equal 429, statuses.last
    assert response.headers["retry-after"].present?
    assert_match "Terlalu banyak percobaan", response.body
  end

  test "batas per email tidak menghalangi email lain dari IP yang sama" do
    10.times { post user_session_path, params: { user: { email: "korban@example.com", password: "x" } } }
    post user_session_path, params: { user: { email: "lain@example.com", password: "x" } }
    assert_response :unprocessable_content
  end
end
