# frozen_string_literal: true

# Membuat/mereset akun admin PRODUKSI — BUKAN akun demo password publik
# (lihat demo.rake). Kredensial diambil dari ENV supaya tidak pernah
# ter-hardcode di kode/log:
#
#   ADMIN_EMAIL=admin@instansi.id \
#   ADMIN_PASSWORD='kata-sandi-kuat' \
#   ADMIN_NAME='Administrator' \
#   bin/rails users:create_admin
#
# Di QNAP Container Station: kontainer `web` -> Terminal/Exec, jalankan
# perintah di atas. Idempoten: aman diulang (memperbarui password bila akun
# sudah ada). Jalankan `bin/rails db:seed` lebih dulu bila peran belum ada.
#
# users:bootstrap_admin dipanggil bin/docker-entrypoint bila ADMIN_EMAIL dan
# ADMIN_PASSWORD diisi di .env, supaya admin pertama bisa dibuat tanpa terminal
# (mis. QNAP Container Station). Hanya berjalan selama belum ada admin sama
# sekali, tidak pernah mereset kata sandi, dan kata sandinya wajib diganti saat
# masuk pertama.
namespace :users do
  desc "Buat admin pertama dari ENV bila belum ada admin; tidak pernah menggagalkan start aplikasi"
  task bootstrap_admin: :environment do
    email    = ENV["ADMIN_EMAIL"].to_s.strip.downcase
    password = ENV["ADMIN_PASSWORD"].to_s
    next if email.empty? || password.empty?

    admin_role = Role.find_or_create_by!(code: "admin") { |r| r.name = "Admin" }
    if admin_role.users.exists?
      puts "users:bootstrap_admin: sudah ada admin, dilewati. Kosongkan ADMIN_PASSWORD di .env."
      next
    end
    if password.length < 8
      puts "users:bootstrap_admin: ADMIN_PASSWORD wajib minimal 8 karakter, admin tidak dibuat."
      next
    end

    user = User.find_or_initialize_by(email: email)
    user.full_name = ENV["ADMIN_NAME"].to_s.strip.presence || "Administrator" if user.full_name.blank?
    user.password = user.password_confirmation = password
    user.confirmed_at ||= Time.current
    if user.save
      user.roles << admin_role
      user.update_columns(active_role_id: admin_role.id, must_change_password: true)
      puts "users:bootstrap_admin: admin pertama dibuat (#{email}). Kata sandi wajib diganti saat masuk. Kosongkan ADMIN_PASSWORD di .env."
    else
      puts "users:bootstrap_admin: admin tidak dibuat: #{user.errors.full_messages.to_sentence}"
    end
  end

  desc "Buat/reset akun admin produksi dari ENV ADMIN_EMAIL/ADMIN_PASSWORD/ADMIN_NAME"
  task create_admin: :environment do
    email    = ENV["ADMIN_EMAIL"].to_s.strip.downcase
    password = ENV["ADMIN_PASSWORD"].to_s
    name     = ENV["ADMIN_NAME"].to_s.strip.presence || "Administrator"

    abort "ADMIN_EMAIL wajib diisi." if email.empty?
    abort "ADMIN_PASSWORD wajib minimal 8 karakter." if password.length < 8

    admin_role = Role.find_or_create_by!(code: "admin") { |r| r.name = "Admin" }

    user = User.find_or_initialize_by(email: email)
    baru = user.new_record?
    user.full_name = name if user.full_name.blank?
    user.password = password
    user.password_confirmation = password
    user.confirmed_at ||= Time.current if user.respond_to?(:confirmed_at)
    user.save!

    user.roles << admin_role unless user.has_role?("admin")
    user.update!(active_role: admin_role) if user.active_role.nil?

    puts(baru ? "Admin DIBUAT: #{email}" : "Admin DIPERBARUI (password direset): #{email}")
    puts "Peran: #{user.roles.pluck(:code).join(', ')}"
  end
end
