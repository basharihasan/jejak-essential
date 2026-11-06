require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "landing page JEJAK Essential terbuka tanpa login dan mencantumkan AIPKI" do
    get root_path

    assert_response :success
    assert_match "JEJAK Essential", response.body
    assert_match "Asosiasi Institusi Pendidikan Kedokteran Indonesia", response.body
    assert_select "section#aipki"
    assert_select "img[alt='Logo Diktisaintek Berdampak']"
    assert_select "a[href=?]", new_user_session_path
  end

  test "beranda pengguna login mencantumkan peran AIPKI" do
    sign_in users(:budi)

    get dashboard_path

    assert_response :success
    assert_match "dikembangkan dengan dukungan AIPKI", response.body
  end
end
