require "test_helper"

class AcademicAssessmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "mahasiswa melihat capaian pribadinya pada periode berjalan" do
    sign_in users(:siti)

    get academic_assessments_path
    assert_response :success
    assert_match dops_evaluations(:dops_siti_infus).procedure_name, response.body
    assert_match assessment_events(:cbt_blok).name, response.body
  end

  test "tidak menampilkan data mahasiswa lain" do
    sign_in users(:budi)

    get academic_assessments_path
    assert_response :success
    assert_no_match dops_evaluations(:dops_siti_infus).procedure_name, response.body
  end

  # Pengajar yang membuka capaian mahasiswa lain (?student_id=) hanya boleh
  # membuka evaluasi yang ia nilai sendiri — sisanya tampil sebagai teks,
  # bukan tautan yang berujung "tidak memiliki akses".
  test "pengajar hanya mendapat tautan ke evaluasi yang ia nilai sendiri" do
    siti = users(:siti)
    mini_cex = mini_cex_evaluations(:minicex_siti_demam) # dinilai budi

    sign_in users(:wati)
    get academic_assessments_path(student_id: siti.id)
    assert_response :success
    assert_match mini_cex.case_description, response.body
    assert_select "a[href=?]", mini_cex_evaluation_path(mini_cex), count: 0

    sign_in users(:budi)
    get academic_assessments_path(student_id: siti.id)
    assert_select "a[href=?]", mini_cex_evaluation_path(mini_cex)
  end

  test "menampilkan peta kompetensi dan badge target milestone" do
    sign_in users(:siti)

    get academic_assessments_path
    assert_response :success
    assert_match "Peta Kompetensi DOPS", response.body
    assert_match competency_milestones(:klinis_target_current_period).competency_item.title, response.body
    assert_match "target 7/9", response.body
  end
end
