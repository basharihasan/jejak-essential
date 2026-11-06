# Kendali yang diperlukan kaprodi & admin saat menyiapkan instalasi:
#
#   - users.deactivated_at: akun nonaktif tidak bisa masuk dan tidak ikut daftar
#     atau hitungan prodi, tanpa menghapus rekam jejak pendidikannya.
#   - study_programs.srq_enabled_at/srq_enabled_by: SRQ-20 baru tampil bagi
#     mahasiswa setelah kaprodi prodi itu mengaktifkannya.
#   - study_programs.competency_framework: kerangka Peta EPA tiap prodi; kosong
#     berarti kerangka paling awal (perilaku sebelumnya).
#
# Pola aman strong_migrations sama dengan 20261024010001: indeks concurrent +
# FK tanpa validasi; FK divalidasi di migrasi berikutnya.
class AddSetupControls < ActiveRecord::Migration[8.1]
  disable_ddl_transaction!

  def change
    add_column :users, :deactivated_at, :datetime
    add_column :study_programs, :srq_enabled_at, :datetime
    add_reference :study_programs, :srq_enabled_by, index: { algorithm: :concurrently }
    add_foreign_key :study_programs, :users, column: :srq_enabled_by_id, validate: false
    add_reference :study_programs, :competency_framework, index: { algorithm: :concurrently }
    add_foreign_key :study_programs, :competency_frameworks, validate: false
  end
end
