# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :authenticate_user!

  # Fitur "Ganti Peran": hanya menukar users.active_role_id, tanpa sesi/token
  # terpisah — cukup untuk akun multi-peran.
  def switch
    if current_user.switch_active_role!(params[:role_code])
      redirect_to dashboard_path, notice: "Peran aktif diganti ke #{current_user.active_role.name}."
    else
      redirect_back fallback_location: dashboard_path, alert: "Anda tidak memiliki peran itu."
    end
  end
end
