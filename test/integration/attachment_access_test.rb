require "test_helper"

# Lampiran hanya terbuka bagi yang berhak membuka rekamannya. Rute bawaan
# Active Storage dimatikan karena tautannya terbuka tanpa login dan tidak
# kedaluwarsa, padahal bukti kasus bisa memuat foto pasien.
class AttachmentAccessTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  PDF = "%PDF-1.4\nBUKTI-RAHASIA\n%%EOF"
  PNG = Base64.decode64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=")

  setup do
    @case = clinical_cases(:submitted_case_siti)
    @case.evidence_files.attach(io: StringIO.new(PDF), filename: "foto pasien.pdf", content_type: "application/pdf")
    @file = @case.evidence_files.last
  end

  def account(role_code, slug, program: nil)
    user = User.create!(full_name: slug, email: "#{slug}@example.com", password: "Str0ngPass!x",
                        confirmed_at: Time.current, study_program: program)
    user.roles << roles(role_code)
    user
  end

  def assert_downloaded
    assert_response :success
    assert_equal PDF, response.body
    assert_match "attachment", response.headers["Content-Disposition"]
    assert_match "no-store", response.headers["Cache-Control"]
  end

  def assert_refused
    assert_response :redirect
    assert_no_match "BUKTI-RAHASIA", response.body
  end

  test "tanpa login diarahkan ke halaman masuk" do
    get stored_attachment_path(@file)
    assert_redirected_to new_user_session_path
  end

  test "tautan bawaan Active Storage tidak berlaku lagi" do
    get "/rails/active_storage/blobs/redirect/#{@file.blob.signed_id}/foto.pdf"
    assert_response :not_found
  end

  test "pemilik dan pengajar mengunduh bukti kasus; mahasiswa lain ditolak" do
    sign_in users(:siti)
    get stored_attachment_path(@file)
    assert_downloaded
    sign_out users(:siti)

    sign_in users(:budi)
    get stored_attachment_path(@file)
    assert_downloaded
    sign_out users(:budi)

    sign_in account(:mahasiswa, "mahasiswa-lain")
    get stored_attachment_path(@file)
    assert_refused
  end

  test "bukti pada draf kasus tertutup bagi pengajar" do
    draft = clinical_cases(:draft_case_siti)
    draft.evidence_files.attach(io: StringIO.new(PDF), filename: "draf.pdf", content_type: "application/pdf")

    sign_in users(:budi)
    get stored_attachment_path(draft.evidence_files.last)
    assert_refused
  end

  test "halaman kasus menautkan ke unduhan berizin" do
    sign_in users(:siti)
    get clinical_case_path(@case)
    assert_select "a[href=?]", stored_attachment_path(@file)
    assert_no_match "/rails/active_storage", response.body
  end

  test "bukti kegiatan mengikuti izin kegiatannya" do
    log = activity_logs(:kegiatan_siti)
    log.evidence_files.attach(io: StringIO.new(PDF), filename: "bukti.pdf", content_type: "application/pdf")

    sign_in users(:siti)
    get stored_attachment_path(log.evidence_files.last)
    assert_downloaded
    sign_out users(:siti)

    sign_in account(:mahasiswa, "mahasiswa-lain")
    get stored_attachment_path(log.evidence_files.last)
    assert_refused
  end

  test "dokumen asesmen terbuka bagi pemilik dan kaprodi prodinya, tertutup bagi kaprodi prodi lain" do
    instance = assessment_instances(:siti_cbt_1)
    instance.document.attach(io: StringIO.new(PDF), filename: "esai.pdf", content_type: "application/pdf")
    attachment = instance.document.attachment

    sign_in users(:siti)
    get stored_attachment_path(attachment)
    assert_downloaded
    sign_out users(:siti)

    sign_in users(:dedi) # kaprodi prodi yang sama
    get stored_attachment_path(attachment)
    assert_downloaded
    sign_out users(:dedi)

    sign_in account(:kaprodi, "kaprodi-lain", program: study_programs(:profesi_dokter))
    get stored_attachment_path(attachment)
    assert_refused
  end

  test "foto profil tampil bagi pemiliknya, tertutup bagi akun lain" do
    siti = users(:siti)
    siti.avatar.attach(io: StringIO.new(PNG), filename: "foto.png", content_type: "image/png")
    attachment = siti.avatar.attachment

    sign_in siti
    get profile_path
    assert_select "img[src=?]", stored_attachment_path(attachment)
    get stored_attachment_path(attachment)
    assert_response :success
    assert_match "inline", response.headers["Content-Disposition"]
    sign_out siti

    sign_in users(:budi)
    get stored_attachment_path(attachment)
    assert_response :redirect
  end

  test "berkas yang hilang dari penyimpanan menghasilkan 404, bukan galat" do
    @file.blob.service.delete(@file.blob.key)

    sign_in users(:siti)
    get stored_attachment_path(@file)
    assert_response :not_found
  end
end
