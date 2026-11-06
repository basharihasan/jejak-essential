# frozen_string_literal: true

# Pengaturan aplikasi tingkat instansi (key → jsonb): Pendaftaran mandiri dan
# Contextual Privacy Mode. Privacy Mode bawaannya NYALA (gagal ke arah aman) — sakelar
# yang melindungi data pasien tidak boleh diam-diam mati karena barisnya
# belum pernah dibuat. ENV PRIVACY_MODE (true/false) menjadi palang darurat
# yang mengunci nilainya.
class AppSetting < ApplicationRecord
  PRIVACY_MODE_KEY = "privacy_mode"
  REGISTRATION_KEY = "registration_open"

  belongs_to :updated_by, class_name: "User", optional: true

  validates :key, presence: true, uniqueness: true

  def self.privacy_mode?
    if ENV["PRIVACY_MODE"].present?
      return ActiveModel::Type::Boolean.new.cast(ENV["PRIVACY_MODE"])
    end

    row = find_by(key: PRIVACY_MODE_KEY)
    return true if row.nil?

    ActiveModel::Type::Boolean.new.cast(row.value["enabled"]) != false
  end

  def self.privacy_mode_locked_by_env?
    ENV["PRIVACY_MODE"].present?
  end

  def self.set_privacy_mode!(enabled, by:)
    row = find_or_initialize_by(key: PRIVACY_MODE_KEY)
    row.value = { "enabled" => ActiveModel::Type::Boolean.new.cast(enabled) }
    row.updated_by = by
    row.save!
    row
  end

  def self.privacy_mode_row
    find_by(key: PRIVACY_MODE_KEY)
  end

  # Tanpa baris berarti terbuka, supaya instalasi lama tidak berubah saat
  # dimutakhirkan. Instalasi baru ditutup oleh db/seeds.rb.
  def self.registration_open?
    row = find_by(key: REGISTRATION_KEY)
    row.nil? || ActiveModel::Type::Boolean.new.cast(row.value["enabled"]) != false
  end

  def self.set_registration_open!(enabled, by:)
    row = find_or_initialize_by(key: REGISTRATION_KEY)
    row.value = { "enabled" => ActiveModel::Type::Boolean.new.cast(enabled) }
    row.updated_by = by
    row.save!
    row
  end
end
