# Kedua kolom baru masih NULL semua, jadi validasi ini tidak memindai apa pun —
# tapi FK yang tervalidasi tetap dijaga Postgres.
class ValidateSetupControlsForeignKeys < ActiveRecord::Migration[8.1]
  def change
    validate_foreign_key :study_programs, :users, column: :srq_enabled_by_id
    validate_foreign_key :study_programs, :competency_frameworks
  end
end
