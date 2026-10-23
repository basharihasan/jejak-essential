# frozen_string_literal: true

class PanduanController < ApplicationController
  before_action :authenticate_user!

  # Konten ditulis maintainer di app/views/panduan/panduan.md (bukan input
  # pengguna), jadi keluaran Kramdown aman ditandai html_safe tanpa sanitasi
  # tambahan — berbeda dari markdown yang berasal dari pengguna.
  def index
    markdown = File.read(Rails.root.join("app/views/panduan/panduan.md"))
    html = Kramdown::Document.new(markdown, input: "kramdown").to_html
    @content_html = with_screenshot_assets(html).html_safe
  end

  private

  # Screenshot ditulis di panduan.md sebagai `![...](panduan/nama.png)` dan
  # disimpan di app/assets/images/panduan/. Di sini src-nya diarahkan ke aset
  # Propshaft (nama ber-digest, bisa di-cache lama) dan dimuat malas karena
  # satu halaman memuat puluhan gambar.
  def with_screenshot_assets(html)
    html.gsub(%r{<img src="(panduan/[^"]+)"}) do
      %(<img loading="lazy" src="#{helpers.image_path(Regexp.last_match(1))}")
    end
  end
end
