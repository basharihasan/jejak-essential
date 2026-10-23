require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "daftar akun baru memberi peran sesuai role_code, tanpa menyentuh kolom User" do
    assert_difference "User.count", 1 do
      post user_registration_path, params: {
        user: {
          full_name: "Andi Baru",
          email: "andi.baru@example.com",
          role_code: "mahasiswa",
          password: "rahasia-kuat-1",
          password_confirmation: "rahasia-kuat-1"
        }
      }
    end

    user = User.order(:id).last
    assert_equal "Andi Baru", user.full_name
    assert user.has_role?("mahasiswa")
    assert_equal roles(:mahasiswa), user.active_role
  end

  # Regresi: role_code sempat ikut ke User.new lewat sign_up_params bawaan
  # Devise dan meledak sebagai ActiveModel::UnknownAttributeError karena
  # bukan kolom User — role_code murni dipakai assign_initial_role.
  test "role_code tidak diteruskan sebagai atribut User" do
    post user_registration_path, params: {
      user: {
        full_name: "Citra Baru",
        email: "citra.baru@example.com",
        role_code: "dosen",
        password: "rahasia-kuat-1",
        password_confirmation: "rahasia-kuat-1"
      }
    }

    assert_response :redirect
  end

  test "role_code tidak dikenal jatuh ke peran mahasiswa" do
    post user_registration_path, params: {
      user: {
        full_name: "Dedi Baru",
        email: "dedi.baru@example.com",
        role_code: "peran_tidak_ada",
        password: "rahasia-kuat-1",
        password_confirmation: "rahasia-kuat-1"
      }
    }

    user = User.order(:id).last
    assert_equal "Dedi Baru", user.full_name
    assert user.has_role?("mahasiswa")
  end

  test "Pengaturan Akun tampil berbahasa Indonesia tanpa tombol hapus akun" do
    sign_in users(:siti)
    get edit_user_registration_path

    assert_response :success
    assert_select "h1", "Pengaturan Akun"
    assert_select "input[name=?]", "user[current_password]"
    assert_select "form[action=?] input[name=_method][value=delete]", user_registration_path, count: 0
  end

  test "hapus akun mandiri ditolak dengan pesan, bukan galat foreign key" do
    sign_in users(:budi)
    assert_no_difference "User.count" do
      delete user_registration_path
    end
    assert_redirected_to edit_user_registration_path
    assert_match "Hubungi admin", flash[:alert]
  end
end

class RegistrationsSelfRegistrableRoleTest < ActionDispatch::IntegrationTest
  # Dosen/preseptor membuka kasus klinis (dan Break Glass identitas pasien)
  # seluruh mahasiswa; kaprodi/admin seluruh prodi/instalasi — tidak satu pun
  # boleh diklaim sendiri lewat form Daftar publik, termasuk lewat form yang diubah.
  %w[admin kaprodi dosen preseptor].each do |code|
    test "role_code #{code} dari form Daftar jatuh ke mahasiswa" do
      post user_registration_path, params: {
        user: {
          full_name: "Eka #{code}",
          email: "eka.#{code}@example.com",
          role_code: code,
          password: "rahasia-kuat-1",
          password_confirmation: "rahasia-kuat-1"
        }
      }

      user = User.find_by!(email: "eka.#{code}@example.com")
      assert_not user.has_role?(code)
      assert user.has_role?("mahasiswa")
      assert_equal roles(:mahasiswa), user.active_role
    end
  end

  test "form Daftar tidak menawarkan pilihan peran dan menjelaskan akun pengajar dari admin" do
    get new_user_registration_path

    assert_response :success
    assert_select "select[name='user[role_code]']", count: 0
    assert_select '[data-testid="self-registration-role-note"]', /Mahasiswa/
  end

  test "pendaftar baru tidak bisa membuka kasus klinis mahasiswa lain" do
    post user_registration_path, params: {
      user: { full_name: "Orang Asing", email: "asing.daftar@example.com", role_code: "dosen",
              password: "rahasia-kuat-1", password_confirmation: "rahasia-kuat-1" }
    }
    user = User.find_by!(email: "asing.daftar@example.com")
    assert_not user.instructor?
    assert_not ClinicalCasePolicy.new(user, clinical_cases(:submitted_case_siti)).break_glass?
  end
end
