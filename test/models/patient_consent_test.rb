require "test_helper"
require Rails.root.join("db/migrate/20261106010001_encrypt_patient_consent_signer_names")

class PatientConsentTest < ActiveSupport::TestCase
  setup do
    @consent = clinical_cases(:submitted_case_siti).create_patient_consent!
  end

  def raw_signer_name
    ActiveRecord::Base.connection.select_value("SELECT signer_name FROM patient_consents WHERE id = #{@consent.id}")
  end

  test "nama penanda tangan tersimpan terenkripsi" do
    @consent.sign!(answers: { "education" => "1" }, signer_name: "Ahmad Fauzi", signer_relation: "pasien")

    assert_not_includes raw_signer_name, "Ahmad"
    assert_equal "Ahmad Fauzi", @consent.reload.signer_name
    assert_equal "AF***", @consent.masked_signer_name
  end

  test "migrasi mengenkripsi nama lama dan aman dijalankan ulang" do
    ActiveRecord::Base.connection.update("UPDATE patient_consents SET signer_name = 'Nama Lama' WHERE id = #{@consent.id}")
    migration = EncryptPatientConsentSignerNames.new

    migration.up
    encrypted = raw_signer_name
    assert_not_equal "Nama Lama", encrypted
    assert_equal "Nama Lama", @consent.reload.signer_name

    migration.up
    assert_equal encrypted, raw_signer_name, "baris terenkripsi tidak boleh dienkripsi lagi"

    migration.down
    assert_equal "Nama Lama", raw_signer_name
  end
end
