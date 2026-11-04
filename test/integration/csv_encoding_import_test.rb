require "test_helper"

# Berkas CSV yang disimpan Excel di Windows berkodekan Windows-1252, bukan
# UTF-8. Dulu hanya importer Glide yang menerimanya; master data, impor
# pengguna, dan impor nilai event menolaknya ("Invalid byte sequence in
# UTF-8"), dan byte yang tak terdefinisi di Windows-1252 membuat impor Glide
# galat 500.
class CsvEncodingImportTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:budi)
    @admin.roles << roles(:admin)
    @admin.update!(active_role: roles(:admin))
    sign_in @admin
  end

  def windows_1252_upload(text, name = "data.csv")
    Rack::Test::UploadedFile.new(StringIO.new(text.encode("Windows-1252").b), "text/csv", original_filename: name)
  end

  test "impor master diagnosis menerima CSV Windows-1252" do
    assert_difference "DiagnosisDefinition.count", 1 do
      post import_admin_diagnosis_definitions_path,
           params: { file: windows_1252_upload("nama,kode_icd10,level_skdi,sistem\nPenyakit Behçet,M35.2,3A,Muskuloskeletal\n") }
    end
    assert DiagnosisDefinition.exists?(name: "Penyakit Behçet")
  end

  test "impor pengguna menerima CSV Windows-1252" do
    assert_difference "User.count", 1 do
      post import_admin_users_path, params: { file: windows_1252_upload("email,nama,peran\njose.win@example.com,José Ramírez,mahasiswa\n") }
    end
    assert_response :success
    assert_equal "José Ramírez", User.find_by(email: "jose.win@example.com").full_name
  end

  test "pratinjau impor nilai event menerima CSV Windows-1252" do
    event = assessment_events(:cbt_blok)
    post import_preview_admin_assessment_event_path(event),
         params: { file: windows_1252_upload("email,nama_mahasiswa,skor\nsiti@example.com,André,80\n") }

    assert_response :success
    assert_match "André", response.body
  end

  test "impor Glide dengan byte tak terdefinisi tidak galat 500" do
    upload = Rack::Test::UploadedFile.new(StringIO.new("email,exam_code,exam_title,total_score\nx\x81@contoh.test,C1,Ujian,50\n".b),
                                          "text/csv", original_filename: "data.csv")
    post csv_import_admin_glide_syncs_path, params: { importer_type: "cbt", csv_file: upload }

    assert_redirected_to admin_glide_sync_path(GlideImport.last)
  end
end
