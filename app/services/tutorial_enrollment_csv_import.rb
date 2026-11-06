# frozen_string_literal: true

# Impor massal Enrolment Tutorial — lihat PlacementCsvImport.
class TutorialEnrollmentCsvImport < PlacementCsvImport
  HEADERS = %w[email periode blok kelompok mulai selesai tutor].freeze
  EXAMPLE = [ "nadia@kampus.ac.id", "2026/2027 Ganjil", "Sistem Kardiovaskular", "Kelompok 3", "2026-10-05", "2026-11-27", "dr.maya@kampus.ac.id" ].freeze
  COLUMN_ALIASES = {
    place: %w[blok blok_sistem sistem block],
    detail: %w[kelompok kelompok_tutorial group],
    supervisor: %w[tutor email_tutor dosen_tutor]
  }.freeze
  PLACE_LABEL = "Blok"
  DETAIL_LABEL = "Kelompok"
  SUPERVISOR_LABEL = "Tutor"
  # Sama dengan pilihan di form Tambah Enrolment.
  SUPERVISOR_ROLES = %w[dosen].freeze

  private

  def model = TutorialEnrollment
  def place_of(enrollment) = enrollment.block_name

  def placement_attributes(match)
    { block_name: match.place, group_name: match.detail, tutor: match.supervisor,
      start_date: match.start_date, end_date: match.end_date }
  end
end
