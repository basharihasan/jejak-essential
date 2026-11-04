# frozen_string_literal: true

# Satu baris Assessment Matrix: event asesmen X menyumbang N% nilai unit.
class AssessmentMapping < ApplicationRecord
  include CappedWeight

  belongs_to :learning_unit
  belongs_to :assessment_event

  validates :weight, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :assessment_event_id, uniqueness: { scope: :learning_unit_id, message: "sudah dipetakan ke unit ini" }
  caps_weight_total_by :learning_unit_id, label: "Learning Unit"
end
