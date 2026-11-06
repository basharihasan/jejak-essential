require "test_helper"

class PlacementImportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:budi)
    @admin.roles << roles(:admin)
    @admin.update!(active_role: roles(:admin))
    @period = academic_periods(:current_period)
  end

  def csv_upload(content)
    Rack::Test::UploadedFile.new(StringIO.new(content), "text/csv", original_filename: "penempatan.csv")
  end

  def rotation_csv
    "email,periode,bagian,wahana,mulai,selesai,preseptor\n" \
      "siti@example.com,#{@period.name},Ilmu Saraf,RSUD Kota,2026-10-12,2026-12-20,wati@example.com\n" \
      "hantu@example.com,#{@period.name},Ilmu Saraf,RSUD Kota,2026-10-12,2026-12-20,\n"
  end

  test "selain admin ditolak, termasuk kaprodi" do
    [ users(:dedi), users(:wati), users(:siti) ].each do |user|
      sign_in user
      get import_clinical_rotations_path
      assert_redirected_to root_path

      assert_no_difference("ClinicalRotation.count") do
        post import_clinical_rotations_path, params: { apply: "1", csv_raw: rotation_csv }
      end
      assert_redirected_to root_path
      sign_out user
    end
  end

  test "admin mengunduh template dan menemukan tombol impor" do
    sign_in @admin
    get clinical_rotations_path
    assert_select "a[href=?]", import_clinical_rotations_path, text: "Impor CSV"

    get import_template_clinical_rotations_path(format: :csv)
    assert_response :success
    assert_equal "text/csv", response.media_type
    assert_match "email,periode,bagian,wahana,mulai,selesai,preseptor", response.body

    get import_template_tutorial_enrollments_path(format: :csv)
    assert_match "email,periode,blok,kelompok,mulai,selesai,tutor", response.body
  end

  test "pratinjau tidak menyimpan, terapkan menyimpan baris siap" do
    sign_in @admin
    assert_no_difference "ClinicalRotation.count" do
      post import_clinical_rotations_path, params: { file: csv_upload(rotation_csv) }
    end
    assert_response :unprocessable_entity
    assert_match "1 dari 2 baris siap diproses", response.body
    assert_match "mahasiswa tidak ditemukan", response.body
    assert_select "input[type=hidden][name=csv_raw][value*=?]", "siti@example.com"

    assert_difference "ClinicalRotation.count", 1 do
      post import_clinical_rotations_path, params: { apply: "1", csv_raw: rotation_csv }
    end
    assert_redirected_to clinical_rotations_path
    assert_match "1 baru, 0 diperbarui, 1 dilewati", flash[:notice]
  end

  test "enrolment memakai periode dari form bila kolomnya kosong" do
    sign_in @admin
    csv = "email,blok,kelompok\nsiti@example.com,Blok Impor,Kelompok 2\n"
    assert_difference "TutorialEnrollment.count", 1 do
      post import_tutorial_enrollments_path, params: { apply: "1", default_period_id: @period.id, csv_raw: csv }
    end
    assert_redirected_to tutorial_enrollments_path
    enrollment = TutorialEnrollment.order(:id).last
    assert_equal [ @period, "Blok Impor" ], [ enrollment.academic_period, enrollment.block_name ]
  end

  test "berkas kosong atau kolom keliru dijawab dengan pesan, bukan galat" do
    sign_in @admin
    post import_clinical_rotations_path, params: { file: csv_upload("") }
    assert_response :unprocessable_entity
    assert_match "minimal satu baris", response.body

    post import_clinical_rotations_path, params: { file: csv_upload("nama\nA\n") }
    assert_response :unprocessable_entity
    assert_match "Kolom", response.body
  end
end
