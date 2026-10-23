require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup { sign_in users(:budi) }

  test "menolak akses tanpa login" do
    sign_out users(:budi)
    get search_path
    assert_redirected_to new_user_session_path
  end

  test "kosongkan hasil kalau query kosong" do
    get search_path
    assert_response :success
    assert_no_match users(:siti).email, response.body
  end

  test "menemukan pengguna lewat nama atau email" do
    get search_path, params: { q: "siti" }
    assert_response :success
    assert_match users(:siti).full_name, response.body
  end

  def card_for(user)
    Nokogiri::HTML5(response.body).css("a, div").find { |el| el["class"].to_s.include?("rounded-xl ring-1") && el.text.include?(user.email) }
  end

  test "kartu mahasiswa mengarah ke Dasbor Mahasiswa bagi dosen" do
    get search_path, params: { q: "siti" }
    card = card_for(users(:siti))
    assert_equal "a", card.name
    assert_equal student_dashboard_path(users(:siti)), card["href"]
  end

  test "kartu mahasiswa mengarah ke Dasbor Mahasiswa bagi kaprodi, dan Peta EPA-nya bisa dibuka" do
    sign_in users(:dedi)
    get search_path, params: { q: "siti" }
    assert_equal student_dashboard_path(users(:siti)), card_for(users(:siti))["href"]

    get entrustment_decisions_path(student_id: users(:siti).id)
    assert_response :success
    assert_match users(:siti).full_name, response.body
  end

  test "kartu pengguna non-mahasiswa mengarah ke sunting pengguna bagi admin" do
    users(:budi).roles << roles(:admin)
    get search_path, params: { q: "wati" }
    assert_equal edit_admin_user_path(users(:wati)), card_for(users(:wati))["href"]
  end

  test "mahasiswa tidak bisa memakai pencarian pengguna dan tidak melihat ikonnya" do
    sign_in users(:siti)
    get search_path, params: { q: "a" }
    assert_redirected_to dashboard_path
    follow_redirect!
    assert_select "header a[href=?]", search_path, count: 0
  end

  test "dosen hanya menemukan mahasiswa, bukan akun pengajar/admin" do
    get search_path, params: { q: "example.com" }
    assert_match users(:siti).email, response.body
    assert_no_match users(:wati).email, response.body
    assert_no_match users(:dedi).email, response.body
  end

  test "kaprodi hanya menemukan mahasiswa prodi binaannya" do
    users(:siti).update!(study_program: study_programs(:profesi_dokter))
    sign_in users(:dedi)
    get search_path, params: { q: "siti" }
    assert_response :success
    assert_no_match users(:siti).email, response.body
  end

  test "admin menemukan semua pengguna" do
    users(:budi).roles << roles(:admin)
    get search_path, params: { q: "example.com" }
    [ :siti, :wati, :dedi ].each { |u| assert_match users(u).email, response.body }
  end
end
