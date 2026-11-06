# frozen_string_literal: true

# Monitoring SRQ untuk kaprodi: terkunci ke prodi binaan, hanya skor dan
# kategori. Jawaban per butir tidak pernah ditampilkan, dan admin yang bukan
# kaprodi tidak punya akses.
class SrqMonitoringController < ApplicationController
  before_action :authenticate_user!
  before_action :require_srq_monitor!

  def index
    @academic_periods = AcademicPeriod.ordered
    @selected_period = selected_period
    @monitor = SrqProgramMonitor.new(program: current_user.study_program, period: @selected_period, viewer: current_user)
  end

  def update
    monitor = SrqProgramMonitor.new(program: current_user.study_program, period: nil, viewer: current_user)
    screening = SrqScreening.where(user_id: monitor.students.select(:id)).find(params[:id])
    note = params[:follow_up_note].to_s.strip
    return redirect_back_to_monitoring(alert: "Catatan tindak lanjut wajib diisi.") if note.blank?

    screening.record_follow_up!(by: current_user, note: note)
    redirect_back_to_monitoring(notice: "Tindak lanjut tercatat.")
  end

  private

  def require_srq_monitor!
    return if current_user.can_monitor_srq?

    message = current_user.has_role?("kaprodi") ? "Akun kaprodi belum terhubung ke Program Studi." : "Halaman ini khusus kaprodi."
    redirect_to dashboard_path, alert: message
  end

  def selected_period
    return nil if @academic_periods.empty?

    @academic_periods.find { |period| period.id == params[:academic_period_id].to_i } ||
      @academic_periods.detect { |period| period.start_date <= Date.current && period.end_date >= Date.current } ||
      @academic_periods.first
  end

  def redirect_back_to_monitoring(**flash_options)
    redirect_to srq_monitoring_path(academic_period_id: params[:academic_period_id].presence), **flash_options
  end
end
