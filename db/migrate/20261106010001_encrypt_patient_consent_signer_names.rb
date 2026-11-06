# frozen_string_literal: true

# PatientConsent#signer_name kini terenkripsi. Baris lama masih teks biasa, dan
# tanpa migrasi ini tidak bisa dibaca sama sekali, karena dekripsi menolak teks
# biasa. Hanya kolom ini yang disentuh, dan baris yang sudah terenkripsi
# dilewati, jadi aman dijalankan ulang.
class EncryptPatientConsentSignerNames < ActiveRecord::Migration[8.1]
  # Model polos tanpa `encrypts`, supaya isi kolom terbaca dan tertulis apa adanya.
  class RawConsent < ActiveRecord::Base
    self.table_name = "patient_consents"
  end

  def up
    each_signer_name do |row, name|
      next if encrypted?(name)

      row.update_columns(signer_name: name_type.serialize(name))
    end
  end

  def down
    each_signer_name do |row, name|
      next unless encrypted?(name)

      row.update_columns(signer_name: name_type.deserialize(name))
    end
  end

  private

  def each_signer_name
    RawConsent.where.not(signer_name: [ nil, "" ]).find_each { |row| yield row, row.signer_name }
  end

  def encrypted?(value)
    ActiveRecord::Encryption.encryptor.encrypted?(value)
  end

  def name_type
    PatientConsent.type_for_attribute(:signer_name)
  end
end
