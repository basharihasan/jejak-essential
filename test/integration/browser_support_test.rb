require "test_helper"

# Batas peramban mengikuti dukungan Tailwind v4, bukan preset :modern Rails
# yang menolak iPhone 8/X (mentok di iOS 16).
class BrowserSupportTest < ActionDispatch::IntegrationTest
  UAS = {
    ios_16_7: "Mozilla/5.0 (iPhone; CPU iPhone OS 16_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1",
    ios_15: "Mozilla/5.0 (iPhone; CPU iPhone OS 15_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Mobile/15E148 Safari/604.1",
    chrome_120: "Mozilla/5.0 (Linux; Android 13; SM-A145F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Mobile Safari/537.36",
    chrome_105: "Mozilla/5.0 (Linux; Android 10; SM-A105F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Mobile Safari/537.36"
  }.freeze

  def visit_with(ua)
    get new_user_session_path, headers: { "User-Agent" => UAS.fetch(ua) }
  end

  test "Safari iOS 16.6 (iPhone 8/X) dan Chrome terkini diizinkan" do
    visit_with(:ios_16_7)
    assert_response :success
    visit_with(:chrome_120)
    assert_response :success
  end

  test "peramban di bawah dukungan Tailwind v4 mendapat halaman 406 berbahasa Indonesia" do
    visit_with(:ios_15)
    assert_response :not_acceptable
    assert_match "Peramban Anda perlu diperbarui", response.body

    visit_with(:chrome_105)
    assert_response :not_acceptable
  end
end
