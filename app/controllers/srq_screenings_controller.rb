# frozen_string_literal: true

# Skrining mandiri SRQ-20 oleh mahasiswa. Hanya data milik sendiri yang bisa
# dibuka; kaprodi memantau lewat SrqMonitoringController.
class SrqScreeningsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_student!

  def index
    @screenings = current_user.srq_screenings.recent
    @filled_today = @screenings.find { |screening| screening.screened_on == Date.current }
  end

  def show
    @screening = current_user.srq_screenings.find(params[:id])
  end

  def new
    existing = current_user.srq_screenings.find_by(screened_on: Date.current)
    return redirect_to(existing, notice: "Anda sudah mengisi SRQ hari ini.") if existing

    @screening = current_user.srq_screenings.build(screened_on: Date.current)
    @submitted_answers = {}
  end

  def create
    @submitted_answers = submitted_answer_params
    @screening = current_user.srq_screenings.build(screened_on: Date.current, answers: submitted_answers,
                                                   consented_at: (Time.current if params[:consent] == "1"))
    if @screening.save
      redirect_to @screening, notice: "Jawaban Anda tersimpan."
    else
      render :new, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotUnique
    redirect_to srq_screenings_path, notice: "Anda sudah mengisi SRQ hari ini."
  end

  private

  def require_student!
    return if current_user.has_role?("mahasiswa")

    redirect_to dashboard_path, alert: "Halaman ini khusus mahasiswa."
  end

  # Parameter bukan-hash (kiriman yang dirusak) terbaca kosong, bukan galat.
  def submitted_answer_params
    answers = params[:srq_answers]
    answers.respond_to?(:to_unsafe_h) ? answers.to_unsafe_h : {}
  end

  # Butir yang belum dijawab tetap nil supaya ditolak validasi, bukan terbaca
  # sebagai "tidak".
  def submitted_answers
    (1..SrqScreening::QUESTIONS.size).map { |number| { "ya" => true, "tidak" => false }[@submitted_answers[number.to_s]] }
  end
end
