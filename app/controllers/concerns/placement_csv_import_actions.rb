# frozen_string_literal: true

require "csv"

# Aksi impor CSV bersama ClinicalRotationsController dan
# TutorialEnrollmentsController: unggah → pratinjau → terapkan. Berkas hanya
# diunggah di tahap pratinjau; tahap terapkan mengirim ulang isinya lewat hidden
# field csv_raw (input file tidak bisa di-resubmit), sama dengan Relabel Prodi.
module PlacementCsvImportActions
  extend ActiveSupport::Concern

  MAX_IMPORT_FILE_SIZE = 2.megabytes

  def import
    authorize placement_model, :create?
    load_import_form
    render :import
  end

  def import_create
    authorize placement_model, :create?
    load_import_form
    file = params[:file]
    raw = file.respond_to?(:read) ? file.read : params[:csv_raw].to_s
    return render_import_error("Berkas terlalu besar — maksimal 2 MB.") if raw.bytesize > MAX_IMPORT_FILE_SIZE

    importer = placement_importer.new(csv: raw, default_period: @default_period, actor: current_user)
    @csv_raw = CsvUpload.decode(raw)
    @matches = importer.matches
    return render_import_error("Unggah CSV berisi minimal satu baris data — unduh template dulu kalau belum punya.") if @matches.empty?

    if params[:apply] == "1"
      result = importer.apply!
      redirect_to import_success_path, notice: "Impor selesai — #{result.created} baru, #{result.updated} diperbarui, #{result.skipped} dilewati."
    else
      # POST yang tidak redirect wajib non-2xx supaya Turbo mau merender body-nya.
      render :import, status: :unprocessable_entity
    end
  rescue PlacementCsvImport::Error => e
    render_import_error(e.message)
  rescue ActiveRecord::RecordInvalid => e
    redirect_to({ action: :import }, alert: "Gagal menerapkan, tidak ada yang disimpan: #{e.record.errors.full_messages.to_sentence}")
  end

  def import_template
    authorize placement_model, :create?
    csv = CSV.generate do |rows|
      rows << placement_importer::HEADERS
      rows << placement_importer::EXAMPLE
    end
    send_data "\uFEFF#{csv}", filename: "template_#{placement_model.model_name.plural}.csv", type: "text/csv; charset=utf-8"
  end

  private

  def load_import_form
    @importer_class = placement_importer
    @academic_periods = AcademicPeriod.ordered
    @default_period = @academic_periods.find { |period| period.id == params[:default_period_id].to_i } if params[:default_period_id].present?
  end

  def render_import_error(message)
    @matches = nil
    flash.now[:alert] = message
    render :import, status: :unprocessable_entity
  end
end
