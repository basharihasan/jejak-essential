# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_registration_open, only: %i[new create]

  def create
    super do |user|
      assign_initial_role(user) if user.persisted?
    end
  end

  # Hapus akun mandiri (bawaan Devise) dimatikan: logbook, kasus, dan nilai
  # adalah rekam jejak pendidikan milik program studi, dan akun yang sudah
  # punya riwayat (komentar verifikasi, notifikasi terkirim, templat formulir,
  # dsb.) memang tidak bisa dihapus — foreign key menolaknya dengan galat 500.
  def destroy
    redirect_to edit_user_registration_path, alert: "Akun tidak dapat dihapus sendiri. Hubungi admin program studi Anda.",
                                             status: :see_other
  end

  protected

  # Akun berkata sandi sementara wajib mengisi kata sandi baru — bukan cuma
  # mengganti email lalu terpental kembali ke halaman ini oleh
  # ApplicationController#require_password_change.
  def update_resource(resource, params)
    if resource.must_change_password? && params[:password].blank?
      resource.errors.add(:password, "baru wajib diisi untuk mengganti kata sandi sementara")
      return false
    end

    super
  end

  private

  def ensure_registration_open
    return if AppSetting.registration_open?

    redirect_to new_user_session_path, alert: "Pendaftaran mandiri ditutup. Minta akun ke admin program studi."
  end

  # role_code cuma dipakai assign_initial_role, bukan kolom User — kalau
  # dibiarkan ikut ke User.new (lewat sign_up_params bawaan Devise) akan
  # meledak sebagai ActiveModel::UnknownAttributeError.
  def sign_up_params
    super.except(:role_code)
  end

  # Form Daftar tidak lagi menawarkan pilihan peran, tapi `role_code` dari
  # form lama/yang diubah tetap dibaca: hanya Role::SELF_REGISTRABLE_CODES
  # (mahasiswa) yang dikabulkan — dosen/preseptor/kaprodi/admin jatuh ke
  # mahasiswa. Peran lain diberikan admin belakangan; ini hanya menjamin akun
  # baru langsung punya minimal satu peran aktif supaya Dashboard tidak
  # menemui user tanpa peran sama sekali.
  def assign_initial_role(user)
    requested = params.dig(:user, :role_code)
    role = Role.find_by(code: requested) if Role.self_registrable?(requested)
    role ||= Role.find_by(code: "mahasiswa")
    return if role.nil?

    user.roles << role unless user.roles.include?(role)
    user.update_column(:active_role_id, role.id) if user.active_role_id.nil?
  end
end
