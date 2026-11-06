# frozen_string_literal: true

# Dua program studi tetap dari db/seeds.rb — Sarjana Kedokteran (pssk) dan
# Profesi Dokter (pspd) — bukan hierarki Faculty/University seperti JEJAK.
# Kode & jenjang mengikuti StudyProgram JEJAK supaya instrumen asesmen
# (Fase 25) bisa dibedakan per jenjang.
class StudyProgram < ApplicationRecord
  LEVELS = { "sarjana" => "Sarjana", "profesi" => "Profesi" }.freeze

  # Aplikasi ini dirancang untuk TEPAT dua program studi — Sarjana Kedokteran
  # (pssk) dan Profesi Dokter (pspd), lihat db/seeds.rb. Jumlahnya dikunci agar
  # tidak bisa bertambah lewat UI, API, maupun console (create!/save
  # memvalidasi). Catatan jujur: penguncian ini hanya mengikat pengguna
  # aplikasi yang berjalan — pemegang kode sumber tetap dapat mengubah angka
  # ini, dan tidak ada enkripsi yang mencegahnya (kode AGPL, lihat README).
  MAX_COUNT = 2

  has_many :users, dependent: :nullify
  # Kerangka Peta EPA prodi ini — lihat CompetencyFramework.for_student.
  belongs_to :competency_framework, optional: true
  belongs_to :srq_enabled_by, class_name: "User", optional: true

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\-]+\z/, message: "hanya huruf kecil, angka, dan tanda hubung" }
  validates :level, inclusion: { in: LEVELS.keys }
  validate :within_max_count, on: :create

  scope :ordered, -> { order(:level, :name) }

  # Apakah penambahan prodi baru sudah dikunci (jumlah mencapai batas).
  def self.at_max_count? = count >= MAX_COUNT

  def level_label
    LEVELS.fetch(level, level)
  end

  def sarjana?
    level == "sarjana"
  end

  def profesi?
    level == "profesi"
  end

  # SRQ-20 menampilkan tanda "Perlu Perhatian Segera" yang hanya bisa dilihat
  # kaprodi, jadi kaprodi prodi itu yang mengaktifkannya setelah SOP siap.
  def srq_enabled? = srq_enabled_at.present?

  def enable_srq!(by:)
    update!(srq_enabled_at: Time.current, srq_enabled_by: by)
  end

  def disable_srq!
    update!(srq_enabled_at: nil, srq_enabled_by: nil)
  end

  private

  def within_max_count
    return if StudyProgram.count < MAX_COUNT

    errors.add(:base, "Jumlah program studi dikunci maksimal #{MAX_COUNT}. Prodi yang ada dapat disunting, bukan ditambah.")
  end
end
