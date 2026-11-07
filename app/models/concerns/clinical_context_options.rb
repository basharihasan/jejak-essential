# frozen_string_literal: true

# Konstanta bersama dipakai DopsEvaluation, MiniCexEvaluation, dan
# ClinicalCase: clinical_setting/patient_age_group/case_complexity.
# Bukan concern ActiveRecord (tidak ada included do...end) karena cuma
# menyediakan daftar pilihan tetap, bukan perilaku model.
module ClinicalContextOptions
  extend ActiveSupport::Concern

  CLINICAL_SETTINGS = {
    "rawat_jalan" => "Rawat Jalan",
    "rawat_inap" => "Rawat Inap",
    "igd" => "IGD",
    "icu" => "ICU",
    "kamar_operasi" => "Kamar Operasi",
    "pelayanan_primer" => "Pelayanan Primer"
  }.freeze

  AGE_GROUPS = {
    "anak" => "Anak",
    "dewasa" => "Dewasa",
    "lansia" => "Lansia"
  }.freeze

  CASE_COMPLEXITY = {
    "rendah" => "Rendah",
    "sedang" => "Sedang",
    "tinggi" => "Tinggi"
  }.freeze
end
