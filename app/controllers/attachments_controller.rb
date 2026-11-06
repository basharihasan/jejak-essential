# frozen_string_literal: true

# Satu-satunya pintu unduhan lampiran. Rute bawaan Active Storage dimatikan
# (lihat config/application.rb) karena tautannya terbuka tanpa login dan tidak
# kedaluwarsa, padahal bukti kasus bisa memuat foto pasien. Di sini setiap
# unduhan diperiksa terhadap izin membuka rekaman pemilik lampirannya, jadi
# tautan yang tersalin tidak berguna bagi orang yang tidak berhak.
#
# Sengaja send_data, bukan ActiveStorage::Streaming: modul itu memakai
# ActionController::Live, yang menjalankan controller di thread lain sehingga
# bentrok dengan throw :warden milik Devise. Ukuran lampiran sudah dibatasi
# (AttachmentValidation, maks. 20 MB), jadi aman dimuat ke memori.
class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def show
    attachment = ActiveStorage::Attachment.find(params[:id])
    authorize_attachment!(attachment)

    blob = attachment.blob
    response.headers["Cache-Control"] = "private, no-store"
    send_data blob.download, filename: blob.filename.sanitized, type: blob.content_type_for_serving,
                             disposition: (blob.forced_disposition_for_serving || disposition_for(attachment)).to_s
  rescue ActiveStorage::FileNotFoundError
    head :not_found
  end

  private

  def authorize_attachment!(attachment)
    record = attachment.record
    case record
    when ClinicalCase, ActivityLog, AssessmentInstance
      authorize record, :show?
    when User
      raise Pundit::NotAuthorizedError unless record == current_user || current_user.has_role?("admin")
    else
      raise Pundit::NotAuthorizedError
    end
  end

  # Foto profil tampil di halaman; lampiran lain selalu diunduh.
  def disposition_for(attachment)
    attachment.name == "avatar" ? "inline" : "attachment"
  end
end
