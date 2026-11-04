# frozen_string_literal: true

# Baris pembobotan (mapping kompetensi Blueprint, komponen Assessment Matrix
# Learning Unit) yang total bobotnya per induk tidak boleh melewati 100%.
# Total di bawah 100% tetap boleh — penyusunan memang bertahap; induknya
# menandai "belum 100%" lewat weights_complete?.
#
# Baris lain dibaca dari database, bukan dari koleksi asosiasi induk: saat
# dibuat lewat induk.mappings.new, koleksi di memori sudah memuat baris baru
# ini sendiri dan akan terhitung dua kali.
module CappedWeight
  extend ActiveSupport::Concern

  MAX_TOTAL = 100

  class_methods do
    def caps_weight_total_by(parent_key, label:)
      validate do
        parent_id = self[parent_key]
        next if weight.blank? || parent_id.blank?

        others = self.class.where(parent_key => parent_id).where.not(id: id).sum(:weight).to_f
        next if others + weight.to_f <= MAX_TOTAL + 0.001

        errors.add(:weight, "melebihi sisa bobot #{label} — tersisa #{[ MAX_TOTAL - others, 0 ].max.round(1)}%")
      end
    end
  end
end
