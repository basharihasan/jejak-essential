# frozen_string_literal: true

# Konfigurasi → Pengguna: daftar, sunting peran/prodi, reset kata sandi ke
# bawaan, dan impor CSV. Gerbangnya has_role?("admin") — sama dengan policy
# halaman konfigurasi lain, bukan peran aktif.
class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!
  before_action :set_user, only: %i[edit update destroy reset_password confirm_email deactivate reactivate]
  before_action :reject_own_account, only: %i[destroy deactivate]

  def index
    @query = params[:q].to_s.strip
    @role_code = params[:role].presence
    @study_program_id = params[:study_program_id].presence

    scope = User.includes(:roles, :study_program, :active_role).order(:full_name)
    if @query.present?
      like = "%#{ActiveRecord::Base.sanitize_sql_like(@query)}%"
      scope = scope.where("full_name ILIKE :q OR email ILIKE :q", q: like)
    end
    scope = scope.joins(:roles).where(roles: { code: @role_code }).distinct if @role_code
    scope = scope.where(study_program_id: @study_program_id) if @study_program_id

    @users = scope.page(params[:page]).per(25)
    @roles = Role.order(:name)
    @study_programs = StudyProgram.ordered
    @registration_open = AppSetting.registration_open?
  end

  def edit
    load_form_collections
  end

  def update
    role_ids = Array(params.dig(:user, :role_ids)).reject(&:blank?).map(&:to_i)
    if role_ids.empty?
      @user.errors.add(:base, "Pengguna harus memiliki minimal satu peran.")
      load_form_collections
      return render :edit, status: :unprocessable_entity
    end

    @user.assign_attributes(user_params)
    if User.program_required_for_roles?(Role.where(id: role_ids).pluck(:code)) && @user.study_program_id.nil?
      @user.errors.add(:base, "Kaprodi wajib punya Program Studi: itulah prodi binaannya.")
      load_form_collections
      return render :edit, status: :unprocessable_entity
    end

    User.transaction do
      @user.save!
      @user.role_ids = role_ids
      @user.update!(active_role_id: role_ids.first) unless role_ids.include?(@user.active_role_id)
    end
    redirect_to admin_users_path, notice: "Data #{@user.full_name} diperbarui."
  rescue ActiveRecord::RecordInvalid
    load_form_collections
    render :edit, status: :unprocessable_entity
  end

  # Admin yang mereset kata sandi sekaligus menjamin akunnya — email ikut
  # dikonfirmasi dan kunci (terlalu banyak salah kata sandi) dibuka, kalau
  # tidak pengguna tetap tertahan walau kata sandinya benar. Kata sandinya
  # sementara & acak, ditampilkan sekali lewat flash ke admin, dan wajib
  # diganti pengguna saat masuk.
  def reset_password
    temporary = @user.assign_temporary_password
    @user.confirmed_at ||= Time.current
    @user.locked_at = nil
    @user.failed_attempts = 0
    @user.save!
    flash[:temporary_password] = temporary
    redirect_to edit_admin_user_path(@user), notice: "Kata sandi #{@user.full_name} direset ke kata sandi sementara.", status: :see_other
  end

  def confirm_email
    @user.confirm unless @user.confirmed?
    redirect_to edit_admin_user_path(@user), notice: "Email #{@user.email} ditandai terkonfirmasi.", status: :see_other
  end

  def deactivate
    @user.update_column(:deactivated_at, Time.current)
    redirect_to edit_admin_user_path(@user), notice: "Akun #{@user.full_name} dinonaktifkan.", status: :see_other
  end

  def reactivate
    @user.update_column(:deactivated_at, nil)
    redirect_to edit_admin_user_path(@user), notice: "Akun #{@user.full_name} diaktifkan kembali.", status: :see_other
  end

  # Hanya akun tanpa rekam jejak; lihat User#deletable?.
  def destroy
    unless @user.deletable?
      return redirect_to edit_admin_user_path(@user), status: :see_other,
                         alert: "Akun #{@user.full_name} sudah punya rekam jejak dan tidak dapat dihapus. Nonaktifkan saja."
    end

    @user.destroy!
    redirect_to admin_users_path, notice: "Akun #{@user.full_name} dihapus.", status: :see_other
  end

  def registration
    AppSetting.set_registration_open!(params[:open], by: current_user)
    state = AppSetting.registration_open? ? "dibuka" : "ditutup"
    redirect_to admin_users_path, notice: "Pendaftaran mandiri #{state}.", status: :see_other
  end

  def import; end

  def import_create
    file = params[:file]
    if file.blank?
      redirect_to import_admin_users_path, alert: "Pilih berkas CSV terlebih dahulu."
      return
    end

    @result = UserCsvImporter.new(file).call
    render :import, status: (@result.errors.any? && @result.created.empty? && @result.updated.empty? ? :unprocessable_entity : :ok)
  end

  private

  def require_admin!
    return if current_user.has_role?("admin")

    redirect_to dashboard_path, alert: "Halaman ini khusus admin."
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Supaya admin tidak mengunci dirinya sendiri, dan selalu tersisa satu admin aktif.
  def reject_own_account
    return unless @user == current_user

    redirect_to edit_admin_user_path(@user), alert: "Akun yang sedang Anda pakai tidak dapat dinonaktifkan atau dihapus.", status: :see_other
  end

  def load_form_collections
    @roles = Role.order(:name)
    @study_programs = StudyProgram.ordered
  end

  def user_params
    params.require(:user).permit(:full_name, :study_program_id)
  end
end
