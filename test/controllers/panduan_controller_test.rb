require "test_helper"

class PanduanControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "menolak akses tanpa login" do
    get panduan_path
    assert_redirected_to new_user_session_path
  end

  test "merender markdown panduan sebagai HTML" do
    sign_in users(:budi)
    get panduan_path

    assert_response :success
    assert_select "h1", "Panduan Penggunaan JEJAK Essential"
    assert_select "h2#daftar-isi"
  end

  # kramdown hanya mengenali tabel/fence bila didahului baris kosong; kalau
  # tidak, ia menjatuhkannya sebagai teks pipa mentah tanpa peringatan.
  test "tabel, diagram, dan blok kode tidak bocor sebagai teks mentah" do
    sign_in users(:budi)
    get panduan_path

    doc = Nokogiri::HTML5(response.body)
    body = doc.at_css(".markdown-body")
    assert_operator body.css("table").size, :>=, 10
    assert_operator body.css("svg.dg").size, :>=, 9
    assert_operator body.css("pre code").size, :>=, 2
    leaked = body.css("p").select { |p| p.text.include?("|---") || p.text.start_with?("~~~", "###") }
    assert_empty leaked, "teks mentah bocor: #{leaked.map(&:text).first(3)}"
    # Karakter | tanpa escape di butir daftar membuat kramdown menyulapnya jadi tabel.
    assert_empty body.css("li table").map(&:text), "pakai \\| untuk garis tegak di dalam butir daftar"
  end

  # image_path melempar galat bila berkas di app/assets/images/panduan/ tidak
  # ada, jadi tes ini juga menangkap screenshot yang terhapus atau salah nama.
  test "screenshot dimuat malas dari aset ber-digest dan punya teks alt" do
    sign_in users(:budi)
    get panduan_path

    imgs = Nokogiri::HTML5(response.body).css(".markdown-body img")
    assert_operator imgs.size, :>=, 40
    imgs.each do |img|
      assert_match %r{\A/assets/panduan/[\w-]+-\w+\.png\z}, img["src"]
      assert_equal "lazy", img["loading"]
      assert img["alt"].present?, "alt kosong: #{img['src']}"
    end
  end

  test "setiap tautan anchor di panduan mengarah ke id yang ada" do
    sign_in users(:budi)
    get panduan_path

    doc = Nokogiri::HTML5(response.body)
    ids = doc.css("[id]").map { |el| el["id"] }
    anchors = doc.css(".markdown-body a[href^='#']").map { |a| a["href"].delete_prefix("#") }.uniq
    assert_operator anchors.size, :>, 60
    assert_empty anchors - ids, "anchor mati"
  end
end
