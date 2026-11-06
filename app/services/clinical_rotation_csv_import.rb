# frozen_string_literal: true

# Impor massal Rotasi Klinik — lihat PlacementCsvImport.
class ClinicalRotationCsvImport < PlacementCsvImport
  HEADERS = %w[email periode bagian wahana mulai selesai preseptor].freeze
  EXAMPLE = [ "annisa@kampus.ac.id", "2026/2027 Ganjil", "Ilmu Bedah", "RSUD Kota", "2026-10-12", "2026-12-20", "dr.ari@kampus.ac.id" ].freeze
  COLUMN_ALIASES = {
    place: %w[bagian bagian_departemen departemen stase station],
    detail: %w[wahana rumah_sakit institusi institution],
    supervisor: %w[preseptor email_preseptor preceptor]
  }.freeze
  PLACE_LABEL = "Bagian"
  DETAIL_LABEL = "Wahana"
  SUPERVISOR_LABEL = "Preseptor"
  # Sama dengan pilihan di form Tambah Rotasi.
  SUPERVISOR_ROLES = %w[preseptor dosen].freeze

  private

  def model = ClinicalRotation
  def place_of(rotation) = rotation.station_name

  def placement_attributes(match)
    { station_name: match.place, institution_name: match.detail, preceptor: match.supervisor,
      start_date: match.start_date, end_date: match.end_date }
  end
end
