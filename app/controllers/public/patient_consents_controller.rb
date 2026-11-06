# frozen_string_literal: true

# Lembar persetujuan yang dibuka pasien dari QR — tanpa login, hanya bertoken.
# Tidak pernah menampilkan isi kasus; hanya butir persetujuan + identitas
# institusi mahasiswa yang mencatat.
#
# Terbuka untuk peramban apa pun: yang memindai QR adalah pasien, sering dengan
# ponsel lama yang ditolak allow_browser. Tampilannya punya gaya cadangan di
# layout public_consent.
class Public::PatientConsentsController < ApplicationController
  layout "public_consent"

  before_action :set_consent

  def show; end

  def update
    if @consent.revoked?
      redirect_to public_patient_consent_path(@consent.token), alert: "Lembar persetujuan ini sudah dicabut."
      return
    end
    # Jawaban pasien tidak boleh ditimpa pemegang tautan; mengubah jawaban
    # dilakukan dengan menerbitkan ulang lembar dari halaman kasus.
    if @consent.signed?
      redirect_to public_patient_consent_path(@consent.token), alert: "Lembar ini sudah dijawab. Minta mahasiswa menerbitkan ulang bila ingin mengubah jawaban."
      return
    end

    signer_name = params[:signer_name].to_s.strip
    if signer_name.blank?
      flash.now[:alert] = "Tuliskan nama Anda sebagai tanda persetujuan."
      render :show, status: :unprocessable_entity
      return
    end

    relation = PatientConsent::RELATIONS.key?(params[:signer_relation]) ? params[:signer_relation] : "pasien"
    @consent.sign!(answers: params.fetch(:items, {}).to_unsafe_h, signer_name: signer_name, signer_relation: relation)
    redirect_to public_patient_consent_path(@consent.token), notice: "Terima kasih, jawaban Anda tersimpan."
  end

  private

  def open_to_any_browser?
    true
  end

  def set_consent
    @consent = PatientConsent.includes(clinical_case: { user: :study_program }).find_by!(token: params[:token])
  end
end
