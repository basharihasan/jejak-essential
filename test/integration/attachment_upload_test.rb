require "test_helper"

# Validasi tipe/ukuran/jumlah lampiran dan regresi bukti Kasus Klinis yang
# terhapus setiap kali kasus disunting.
class AttachmentUploadTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  PDF = "%PDF-1.4\n1 0 obj << >> endobj\ntrailer << >>\n%%EOF\n"
  PNG = "\x89PNG\r\n\x1A\n\x00\x00\x00\rIHDR\x00\x00\x00\x01\x00\x00\x00\x01\x08\x06\x00\x00\x00\x1F\x15\xC4\x89".b

  def upload(content, filename, type)
    Rack::Test::UploadedFile.new(StringIO.new(content), type, original_filename: filename)
  end

  def attach_pdf(record, name = :evidence_files)
    record.public_send(name).attach(io: StringIO.new(PDF), filename: "lama.pdf", content_type: "application/pdf")
  end

  setup { sign_in users(:siti) }

  test "menyunting kasus tanpa memilih berkas baru tidak menghapus bukti yang sudah ada" do
    kasus = clinical_cases(:draft_case_siti)
    attach_pdf(kasus)

    patch clinical_case_path(kasus), params: { clinical_case: { diagnosis: "Diubah", evidence_files: [ "" ] } }
    assert_response :redirect
    assert_equal 1, kasus.reload.evidence_files.count
    assert_equal "Diubah", kasus.diagnosis
  end

  test "berkas baru pada kasus ditambahkan, bukan menggantikan" do
    kasus = clinical_cases(:draft_case_siti)
    attach_pdf(kasus)

    patch clinical_case_path(kasus), params: { clinical_case: { evidence_files: [ "", upload(PDF, "baru.pdf", "application/pdf") ] } }
    assert_equal %w[baru.pdf lama.pdf], kasus.reload.evidence_files.map { |f| f.filename.to_s }.sort
  end

  test "berkas berjenis tidak didukung ditolak dan tidak tersimpan" do
    kasus = clinical_cases(:draft_case_siti)

    patch clinical_case_path(kasus), params: { clinical_case: { evidence_files: [ upload("MZ\x90\x00 bukan dokumen".b, "skrip.exe", "application/octet-stream") ] } }
    assert_response :unprocessable_entity
    assert_match "jenis berkas tidak didukung", response.body
    assert_equal 0, kasus.reload.evidence_files.count
  end

  test "ekstensi palsu tidak lolos: jenis dibaca dari isi berkas" do
    log = activity_logs(:kegiatan_siti)
    patch activity_log_path(log), params: { activity_log: { title: log.title, evidence_files: [ upload("<html><script>alert(1)</script></html>", "foto.png", "image/png") ] } }
    assert_response :unprocessable_entity
    assert_match "jenis berkas tidak didukung", response.body
    assert_equal 0, log.reload.evidence_files.count
  end

  test "berkas melebihi batas ukuran ditolak" do
    kasus = clinical_cases(:draft_case_siti)
    besar = PDF + ("0" * (10.megabytes + 1))
    patch clinical_case_path(kasus), params: { clinical_case: { evidence_files: [ upload(besar, "besar.pdf", "application/pdf") ] } }
    assert_response :unprocessable_entity
    assert_match "ukuran maksimal", response.body
  end

  test "lebih dari 10 berkas ditolak, lampiran lama di atas batas tidak mengunci rekaman" do
    kasus = clinical_cases(:draft_case_siti)
    11.times { attach_pdf(kasus) } # lampiran lama sebelum aturan ada — tetap boleh disunting
    patch clinical_case_path(kasus), params: { clinical_case: { diagnosis: "Tetap bisa" } }
    assert_response :redirect

    patch clinical_case_path(kasus), params: { clinical_case: { evidence_files: [ upload(PDF, "ke12.pdf", "application/pdf") ] } }
    assert_response :unprocessable_entity
    assert_match "maksimal 10 berkas", response.body
  end

  test "foto profil hanya gambar web" do
    patch profile_path, params: { user: { avatar: upload(PDF, "cv.pdf", "application/pdf") } }
    assert_response :unprocessable_entity
    assert_not users(:siti).reload.avatar.attached?

    patch profile_path, params: { user: { avatar: upload(PNG, "foto.png", "image/png") } }
    assert_redirected_to profile_path
    assert users(:siti).reload.avatar.attached?
  end

  test "dokumen asesmen yang ditolak tidak mengubah status pengumpulan" do
    # Event rubrik — event ujian tulis/praktik (CBT/OSCE) sudah menolak
    # pengumpulan dokumen sebelum berkasnya diperiksa.
    event = assessment_events(:soca_kardio)
    event.update_columns(status: "published", submission_close_at: nil)
    instance = AssessmentInstance.create!(assessment_event: event, student: users(:siti), attempt_number: 1,
                                          status: "registered", max_score: 100)

    patch submit_student_assessment_path(instance), params: { document: upload("MZ".b, "x.exe", "application/octet-stream") }
    assert_redirected_to student_assessment_path(instance)
    assert_match "Gagal dikumpulkan", flash[:alert]
    assert_equal "registered", instance.reload.status
    assert_not instance.document.attached?
  end
end
