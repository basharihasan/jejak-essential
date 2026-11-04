# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :require_viewer!

  # Pencarian pengguna (nama/email) — pintu masuk Dasbor Mahasiswa bagi
  # pengajar/kaprodi dan sunting akun bagi admin. Bukan direktori umum:
  # mahasiswa tidak bisa memakainya (daftar email seluruh pengguna adalah
  # bahan menebak kata sandi), pengajar hanya menemukan mahasiswa, dan
  # kaprodi non-admin hanya mahasiswa prodi binaannya. Admin melihat semua.
  def index
    @query = params[:q].to_s.strip

    @users = if @query.present?
      like = "%#{ActiveRecord::Base.sanitize_sql_like(@query)}%"
      searchable_users.where("full_name ILIKE :q OR email ILIKE :q", q: like)
                      .includes(:roles).order(:full_name).limit(20)
    else
      User.none
    end
  end

  private

  def require_viewer!
    return if current_user.can_view_students?

    redirect_to dashboard_path, alert: "Pencarian pengguna khusus pengajar, kaprodi, dan admin."
  end

  def searchable_users
    return User.all if current_user.has_role?("admin")

    students = User.where(id: UserRole.joins(:role).where(roles: { code: "mahasiswa" }).select(:user_id))
    current_user.study_program_bound? ? students.where(study_program_id: current_user.study_program_id) : students
  end
end
