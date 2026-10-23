# Pengerasan login:
# - Devise :lockable — akun terkunci sementara setelah berkali-kali salah kata
#   sandi (lihat config.maximum_attempts / unlock_in di initializers/devise.rb).
# - must_change_password — akun berkata sandi sementara (hasil impor CSV atau
#   reset admin) wajib menggantinya sebelum bisa memakai aplikasi.
class AddLockableAndPasswordChangeToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :failed_attempts, :integer, default: 0, null: false
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
    add_column :users, :must_change_password, :boolean, default: false, null: false
    safety_assured { add_index :users, :unlock_token, unique: true }
  end
end
