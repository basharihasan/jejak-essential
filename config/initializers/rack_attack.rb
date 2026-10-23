# frozen_string_literal: true

# Pembatasan laju untuk endpoint yang jadi sasaran tebak kata sandi dan
# penyalahgunaan. Lapis pertama sebelum Devise :lockable (yang mengunci per
# akun) — throttle per IP menahan "password spraying" (satu kata sandi dicoba
# ke banyak akun), throttle per email menahan tebakan beruntun ke satu akun.
#
# Batas per IP sengaja longgar: satu angkatan di jaringan kampus atau CGNAT
# operator seluler bisa berbagi satu IP publik saat masuk bersamaan.
class Rack::Attack
  LOGIN_PATH = "/users/sign_in"

  # Rails.cache produksi = Solid Cache (bersama antar-proses). Lingkungan yang
  # memakai null_store (development tanpa caching, test) tidak bisa menghitung
  # apa pun, jadi pakai memori proses.
  self.cache.store = Rails.cache.is_a?(ActiveSupport::Cache::NullStore) ? ActiveSupport::Cache::MemoryStore.new : Rails.cache

  # Test suite mengirim ratusan login dari 127.0.0.1 — dinyalakan per test
  # yang memang menguji throttle (lihat test/integration/rack_attack_test.rb).
  self.enabled = !Rails.env.test?

  def self.submitted_email(req)
    req.params.dig("user", "email").to_s.strip.downcase.presence
  rescue StandardError # badan permintaan rusak → tidak ikut dihitung per email
    nil
  end

  throttle("logins/ip", limit: 60, period: 5.minutes) do |req|
    req.ip if req.post? && req.path == LOGIN_PATH
  end

  throttle("logins/email", limit: 10, period: 5.minutes) do |req|
    submitted_email(req) if req.post? && req.path == LOGIN_PATH
  end

  throttle("sign_ups/ip", limit: 10, period: 1.hour) do |req|
    req.ip if req.post? && req.path == "/users"
  end

  throttle("password_resets/ip", limit: 10, period: 15.minutes) do |req|
    req.ip if req.post? && req.path == "/users/password"
  end

  throttle("password_resets/email", limit: 3, period: 15.minutes) do |req|
    submitted_email(req) if req.post? && req.path == "/users/password"
  end

  # Halaman publik bertoken (persetujuan pasien, feed iCal) — tokennya sudah
  # panjang, ini sekadar mencegah pemindaian massal.
  throttle("public_tokens/ip", limit: 60, period: 1.minute) do |req|
    req.ip if req.path.start_with?("/persetujuan/", "/kalender/feed/")
  end

  self.throttled_responder = lambda do |request|
    match = request.env["rack.attack.match_data"] || {}
    retry_after = (match[:period] || 60).to_i
    body = <<~HTML
      <!DOCTYPE html>
      <html lang="id"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
      <title>Terlalu banyak percobaan — JEJAK</title></head>
      <body style="font-family:system-ui,sans-serif;max-width:32rem;margin:4rem auto;padding:0 1rem;color:#1e293b">
      <h1 style="font-size:1.25rem">Terlalu banyak percobaan</h1>
      <p>Demi keamanan akun, permintaan dari perangkat atau akun ini dibatasi sementara. Coba lagi dalam beberapa menit.</p>
      <p><a href="/">Kembali ke beranda</a></p>
      </body></html>
    HTML
    [ 429, { "content-type" => "text/html; charset=utf-8", "retry-after" => retry_after.to_s }, [ body ] ]
  end
end
