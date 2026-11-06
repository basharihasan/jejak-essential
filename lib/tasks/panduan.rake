# frozen_string_literal: true

# Versi PDF Panduan Penggunaan (app/views/panduan/panduan.pdf) — dibangkitkan
# dari panduan.md yang sama dengan halaman /panduan, memakai gaya halaman itu,
# diawali halaman sampul (logo AIPKI & Diktisaintek Berdampak), lalu dicetak
# Chrome/Edge headless. Jalankan ulang setiap panduan.md berubah:
#
#   bin/rails panduan:pdf
#   CHROME_PATH="/path/ke/chrome" bin/rails panduan:pdf   # bila tidak terdeteksi
namespace :panduan do
  desc "Bangkitkan app/views/panduan/panduan.pdf dari panduan.md"
  task pdf: :environment do
    require "kramdown"
    require "tmpdir"

    dir = Rails.root.join("app/views/panduan")
    chrome = [ ENV["CHROME_PATH"],
               "C:/Program Files/Google/Chrome/Application/chrome.exe",
               "C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe",
               "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
               "/usr/bin/google-chrome", "/usr/bin/chromium", "/usr/bin/chromium-browser" ].compact.find { |path| File.exist?(path) }
    abort "Chrome/Edge tidak ditemukan — setel CHROME_PATH." unless chrome

    # HTML sementara ada di folder tmp, jadi gambar, logo, dan font dirujuk
    # dengan URL file:// absolut ke berkas aslinya di proyek.
    file_url = ->(path) { "file:///#{path.to_s.tr('\\', '/').delete_prefix('/')}" }

    body = Kramdown::Document.new(File.read(dir.join("panduan.md")), input: "kramdown").to_html
    # Screenshot ditulis `panduan/nama.png` (relatif ke aset, lihat PanduanController).
    images = Rails.root.join("app/assets/images")
    body = body.gsub(%r{<img src="(panduan/[^"]+)"}) { %(<img src="#{file_url.(images.join(Regexp.last_match(1)))}") }
    # Gaya markdown & diagram diambil dari halaman /panduan supaya keduanya tak berbeda.
    style = File.read(dir.join("index.html.erb"))[%r{<style>(.*?)</style>}m, 1]
    updated = I18n.l(Date.current, format: "%-d %B %Y", locale: :id)

    branding = Rails.public_path.join("branding")
    inter = file_url.(Rails.public_path.join("vendor/fonts/inter/InterVariable.woff2"))
    # Ikon buku JEJAK — sama dengan tanda di sidebar (shared/_sidebar).
    book_icon = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">' \
                '<path stroke-linecap="round" stroke-linejoin="round" d="M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 ' \
                ".512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 " \
                '.512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25"/></svg>'

    html = <<~HTML
      <!doctype html>
      <html lang="id">
      <head>
        <meta charset="utf-8">
        <title>Panduan Penggunaan JEJAK Essential</title>
        <style>
          @font-face { font-family: Inter; src: url("#{inter}") format("woff2"); font-weight: 100 900; font-style: normal; }
          #{style}
          @page { size: A4; margin: 16mm 14mm 18mm; @bottom-right { content: "Halaman " counter(page); font: 9px Inter, sans-serif; color: #6b7280; } }
          @page :first { margin: 0; @bottom-right { content: none; } }
          body { margin: 0; font-family: Inter, "Segoe UI", ui-sans-serif, system-ui, sans-serif; font-size: 10.5pt; }
          .markdown-body table { display: table; }
          .markdown-body h2 { break-after: avoid; }
          .markdown-body h3, .markdown-body h4 { break-after: avoid; }
          .markdown-body tr, .markdown-body svg.dg, .markdown-body blockquote { break-inside: avoid; }
          .markdown-body img { max-width: 100%; height: auto; max-height: 235mm; object-fit: contain; break-inside: avoid; }
          .markdown-body h2#daftar-isi + ul { columns: 2; }

          /* ── Sampul: gaya halaman brand JEJAK Essential (navy–indigo, aksen teal) ── */
          .cover { position: relative; box-sizing: border-box; width: 210mm; height: 297mm; padding: 20mm 20mm 17mm;
                   display: flex; flex-direction: column; overflow: hidden; break-after: page; color: #fff;
                   font-family: Inter, sans-serif; -webkit-print-color-adjust: exact; print-color-adjust: exact;
                   background:
                     radial-gradient(115mm 115mm at 100% 0%, rgba(99,102,241,.55), rgba(99,102,241,0) 70%),
                     radial-gradient(120mm 100mm at 0% 100%, rgba(20,184,166,.30), rgba(20,184,166,0) 70%),
                     linear-gradient(165deg, #0b1023 0%, #141a4a 52%, #0b1023 100%); }
          .cover::after { content: ""; position: absolute; right: -38mm; top: 62mm; width: 120mm; height: 120mm; border-radius: 50%;
                          border: 1px solid rgba(165,180,252,.18); box-shadow: 0 0 0 16mm rgba(165,180,252,.04); }
          .cover > * { position: relative; z-index: 1; }
          .cover-brand { display: flex; align-items: center; gap: 12px; }
          .cover-mark { width: 46px; height: 46px; border-radius: 12px; background: #6366f1; color: #fff;
                        display: flex; align-items: center; justify-content: center; box-shadow: 0 10px 28px rgba(30,27,75,.65); }
          .cover-mark svg { width: 27px; height: 27px; }
          .cover-brand strong { display: block; font-size: 16pt; font-weight: 800; letter-spacing: .01em; line-height: 1.1; }
          .cover-brand small { display: block; margin-top: 2px; font-size: 7.5pt; font-weight: 600; letter-spacing: .28em; text-transform: uppercase; color: #a5b4fc; }
          .cover-main { margin: auto 0; padding-bottom: 6mm; }
          .cover-eyebrow { display: inline-block; margin: 0 0 7mm; padding: 5px 13px; border-radius: 999px; font-size: 8pt; font-weight: 700;
                           letter-spacing: .22em; text-transform: uppercase; color: #c7d2fe; background: rgba(99,102,241,.16);
                           border: 1px solid rgba(165,180,252,.35); }
          .cover-title { margin: 0; font-size: 42pt; line-height: 1.04; font-weight: 800; letter-spacing: -0.025em; color: #fff; }
          .cover-tagline { margin: 6mm 0 0; font-size: 17pt; font-weight: 700; line-height: 1.25; letter-spacing: -0.01em;
                           color: #5eead4; }
          .cover-lead { margin: 7mm 0 0; max-width: 128mm; font-size: 11pt; line-height: 1.65; color: #cbd5e1; }
          .cover-roles { list-style: none; margin: 8mm 0 0; padding: 0; display: flex; flex-wrap: wrap; gap: 7px; }
          .cover-roles li { padding: 5px 12px; border-radius: 999px; font-size: 8.5pt; font-weight: 600; color: #e0e7ff;
                            background: rgba(255,255,255,.06); border: 1px solid rgba(165,180,252,.30); }
          .cover-support { margin: 0 0 4mm; font-size: 7.5pt; font-weight: 700; letter-spacing: .24em; text-transform: uppercase; color: #94a3b8; }
          .cover-logos { display: flex; gap: 5mm; }
          .cover-logo { box-sizing: border-box; height: 25mm; padding: 0 7mm; border-radius: 5mm; background: #fff;
                        display: flex; align-items: center; box-shadow: 0 8px 24px rgba(2,6,23,.45); }
          .cover-logo img { display: block; width: auto; height: 17mm; }
          /* Logo Diktisaintek melebar (±3,4:1) — dibuat lebih rendah agar bobot visualnya setara dengan AIPKI. */
          .cover-logo--dikti img { height: 11.5mm; }
          .cover-meta { display: flex; justify-content: space-between; gap: 8mm; margin: 9mm 0 0; padding-top: 4mm;
                        border-top: 1px solid rgba(148,163,184,.22); font-size: 8.5pt; color: #94a3b8; }
          .cover-meta strong { color: #e2e8f0; font-weight: 600; }
        </style>
      </head>
      <body>
        <section class="cover">
          <header class="cover-brand">
            <span class="cover-mark">#{book_icon}</span>
            <span><strong>JEJAK</strong><small>Essential</small></span>
          </header>
          <div class="cover-main">
            <p class="cover-eyebrow">Buku Panduan</p>
            <h1 class="cover-title">Panduan<br>Penggunaan</h1>
            <p class="cover-tagline">JEJAK Essential — Ekosistem Pendidikan<br>Klinis Longitudinal</p>
            <p class="cover-lead">Logbook kegiatan dan kasus klinis, asesmen (DOPS, Mini-CEX, ujian tulis &amp; praktik, rubrik penguji),
              peta kompetensi &amp; EPA, serta dashboard analitik — dalam satu aplikasi.</p>
            <ul class="cover-roles"><li>Mahasiswa</li><li>Dosen</li><li>Preseptor</li><li>Kaprodi</li><li>Admin</li></ul>
          </div>
          <footer>
            <p class="cover-support">Dikembangkan dengan dukungan</p>
            <div class="cover-logos">
              <span class="cover-logo"><img src="#{file_url.(branding.join('aipki-logo.png'))}" alt="Asosiasi Institusi Pendidikan Kedokteran Indonesia (AIPKI)"></span>
              <span class="cover-logo cover-logo--dikti"><img src="#{file_url.(branding.join('Primary_Horizontal-Logo.png'))}" alt="Diktisaintek Berdampak"></span>
            </div>
            <p class="cover-meta"><span>Diperbarui <strong>#{updated}</strong></span><span>Versi PDF dari halaman Panduan Penggunaan (/panduan)</span></p>
          </footer>
        </section>
        <div class="markdown-body">
          #{body}
        </div>
      </body>
      </html>
    HTML

    Dir.mktmpdir do |tmp|
      source = File.join(tmp, "panduan.html")
      File.write(source, html)
      output = dir.join("panduan.pdf").to_s
      ok = system(chrome, "--headless=new", "--disable-gpu", "--no-pdf-header-footer", "--user-data-dir=#{tmp}/profile",
                  "--print-to-pdf=#{output}", "file:///#{source.tr('\\', '/')}", exception: false)
      abort "Gagal mencetak PDF." unless ok && File.exist?(output)
      puts "Tertulis #{output} (#{(File.size(output) / 1024.0).round} KB)"
    end
  end
end
