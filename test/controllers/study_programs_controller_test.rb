require "test_helper"

class StudyProgramsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def sign_in_admin
    admin = users(:budi)
    admin.roles << roles(:admin)
    sign_in admin
    admin
  end

  test "bukan admin ditolak" do
    sign_in users(:dedi) # kaprodi
    get study_programs_path
    assert_response :redirect
  end

  test "admin melihat daftar prodi berkode dan dapat menyunting" do
    sign_in_admin
    get study_programs_path
    assert_response :success
    assert_match "pssk", response.body
    assert_match "pspd", response.body

    patch study_program_path(study_programs(:sarjana_kedokteran)),
          params: { study_program: { name: "Sarjana Kedokteran (S1)", code: "pssk", level: "sarjana" } }
    assert_redirected_to study_programs_path
    assert_equal "Sarjana Kedokteran (S1)", study_programs(:sarjana_kedokteran).reload.name
  end

  test "daftar menyebut penguncian jumlah prodi" do
    sign_in_admin
    get study_programs_path
    assert_match "dikunci maksimal #{StudyProgram::MAX_COUNT}", response.body
  end

  test "menambah prodi ditolak saat jumlah sudah di batas" do
    sign_in_admin
    assert_equal StudyProgram::MAX_COUNT, StudyProgram.count

    get new_study_program_path
    assert_redirected_to study_programs_path
    assert_match "dikunci maksimal", flash[:alert]

    assert_no_difference "StudyProgram.count" do
      post study_programs_path, params: { study_program: { name: "Profesi Ners", code: "profesi-ners", level: "profesi" } }
    end
    assert_redirected_to study_programs_path
    assert_match "dikunci maksimal", flash[:alert]
  end
end
