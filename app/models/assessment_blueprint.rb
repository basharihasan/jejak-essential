# frozen_string_literal: true

# Rencana cakupan asesmen (Blueprinting) — berdiri sendiri tanpa asosiasi
# apa pun. Bukan data hasil, tapi
# rencana: seberapa besar bobot tiap ranah kompetensi dalam satu asesmen.
class AssessmentBlueprint < ApplicationRecord
  has_many :assessment_blueprint_mappings, dependent: :destroy
  has_many :competency_items, through: :assessment_blueprint_mappings
  has_many :learning_units, dependent: :nullify

  validates :name, presence: true

  # Mapping ditambah satu per satu, jadi total di tengah penyusunan wajar
  # belum 100% — itu ditandai di halaman detail (weights_complete?), bukan
  # divalidasi di sini: dulu validasi "harus 100%" di blueprint justru
  # mengunci sunting nama/deskripsi selama mapping belum lengkap, padahal
  # tidak pernah mencegah mapping baru mendorong total melewati 100%. Batas
  # atas itu kini dijaga AssessmentBlueprintMapping.
  def total_weight
    assessment_blueprint_mappings.sum { |m| m.weight.to_f }
  end

  def weights_complete?
    (total_weight - 100).abs < 0.01
  end

  def remaining_weight
    (100 - total_weight).round(1)
  end

  # {CompetencyItem => bobot} — dipakai halaman show untuk radar chart,
  # sudah dalam bentuk siap-pakai (bukan JSONB label bebas lagi).
  def weight_by_competency_item
    assessment_blueprint_mappings.includes(:competency_item).index_by(&:competency_item).transform_values { |m| m.weight.to_f }
  end
end
