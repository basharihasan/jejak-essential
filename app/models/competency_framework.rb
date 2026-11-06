# frozen_string_literal: true

class CompetencyFramework < ApplicationRecord
  has_many :competency_items, -> { order(:position) }, dependent: :destroy, inverse_of: :competency_framework
  has_many :study_programs, dependent: :nullify
  # Diperiksa sebelum simpul-simpulnya dihapus (lihat CompetencyItem).
  before_destroy :ensure_unused_by_entrustment, prepend: true

  validates :name, presence: true

  # Kerangka Peta EPA seorang mahasiswa: pilihan prodinya, atau kerangka paling
  # awal bila prodi belum memilih.
  def self.for_student(student)
    student&.study_program&.competency_framework || order(:id).first
  end

  def domains
    competency_items.where(parent_id: nil)
  end

  private

  def ensure_unused_by_entrustment
    return unless EntrustmentDecision.exists?(competency_item_id: competency_items.select(:id))

    errors.add(:base, "sudah dipakai pada keputusan entrustment (Peta EPA) mahasiswa")
    throw :abort
  end
end
