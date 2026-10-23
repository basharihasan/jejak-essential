# Be sure to restart your server when you modify this file.

# Content Security Policy — lapis pertahanan bila suatu saat ada XSS: skrip
# hanya boleh dari aset sendiri atau skrip inline ber-nonce (importmap, skrip
# tema di layout, grafik Chartkick yang otomatis memakai nonce), tidak ada
# skrip/CDN pihak ketiga, dan halaman tidak bisa dibingkai situs lain.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self
    policy.base_uri    :self
    policy.object_src  :none
    policy.frame_ancestors :none
    policy.script_src  :self
    # Atribut style="" dipakai untuk lebar bilah progres dsb., dan Turbo
    # menyisipkan <style> bilah progresnya — style tidak bisa mengeksekusi kode.
    policy.style_src   :self, :unsafe_inline
    # https: untuk berkas Active Storage di penyimpanan S3-compatible
    # (pengalihan ke host penyedia), data:/blob: untuk QR & pratinjau.
    policy.img_src     :self, :https, :data, :blob
    policy.font_src    :self, :data
    policy.connect_src :self
    policy.worker_src  :self
    policy.manifest_src :self
    # Login Google: formulir POST ke /users/auth/google_oauth2 lalu
    # dialihkan ke Google — form-action ikut diperiksa pada pengalihan itu.
    policy.form_action :self, "https://accounts.google.com"
  end

  # Nonce per sesi (bukan per permintaan): Turbo mempertahankan dokumen dan
  # header CSP halaman pertama, jadi skrip inline di halaman berikutnya harus
  # memakai nonce yang sama. Disimpan di sesi, bukan request.session.id
  # bawaan template Rails — id itu masih kosong pada kunjungan pertama tanpa
  # cookie, sehingga header berisi 'nonce-' kosong dan skrip inline diblokir.
  # Setelah keluar (reset_session) nonce berganti; tag importmap ber-nonce
  # yang di-track Turbo memicu muat ulang penuh, jadi CSP ikut diperbarui.
  # Hanya script-src — nonce di style-src membuat browser mengabaikan
  # 'unsafe-inline' dan memblokir atribut style="".
  config.content_security_policy_nonce_generator = ->(request) { request.session[:csp_nonce] ||= SecureRandom.base64(16) }
  config.content_security_policy_nonce_directives = %w[script-src]
end
