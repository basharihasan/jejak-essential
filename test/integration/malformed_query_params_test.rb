require "test_helper"

# ?page[]=1 / ?student_id[a]=1 dulu menjadi galat 500 di hampir setiap
# halaman daftar (Kaminari memanggil .to_i pada Array; viewed_student
# memanggil has_role? pada hasil User.find(array)). Kini ditolak 400.
class MalformedQueryParamsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "nomor halaman berbentuk array ditolak 400, bukan 500" do
    sign_in users(:siti)

    get activity_logs_path, params: { page: [ "1" ] }
    assert_response :bad_request

    get examiner_evaluations_path, params: { mine_page: [ "1" ] }
    assert_response :bad_request
  end

  test "id berbentuk array atau hash ditolak 400" do
    sign_in users(:budi)

    get academic_assessments_path, params: { student_id: [ users(:siti).id.to_s ] }
    assert_response :bad_request

    get analytics_path, params: { academic_period_id: { a: "1" } }
    assert_response :bad_request
  end

  test "kata kunci pencarian berbentuk array ditolak 400" do
    sign_in users(:budi)

    get search_path, params: { q: "siti" }
    assert_response :success

    get search_path, params: { q: [ "siti" ] }
    assert_response :bad_request
  end

  test "filter berbentuk hash ditolak 400" do
    admin = users(:budi)
    admin.roles << roles(:admin)
    sign_in admin

    get admin_users_path, params: { role: "dosen" }
    assert_response :success

    get admin_users_path, params: { role: { a: "1" } }
    assert_response :bad_request
  end

  test "parameter skalar biasa tetap berjalan" do
    sign_in users(:budi)

    get activity_logs_path, params: { page: "2" }
    assert_response :success

    get "#{activity_logs_path}?unduh"
    assert_response :success

    get academic_assessments_path, params: { student_id: users(:siti).id }
    assert_response :success
  end
end
