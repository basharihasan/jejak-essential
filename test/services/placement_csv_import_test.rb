require "test_helper"

class PlacementCsvImportTest < ActiveSupport::TestCase
  setup do
    @period = academic_periods(:current_period)
    @siti = users(:siti)
    @siti.update!(identifier_number: "2206000101")
  end

  def rotation_import(csv, **options)
    ClinicalRotationCsvImport.new(csv: csv, **options)
  end

  test "pratinjau mencocokkan email, NPM, periode, dan preseptor tanpa menyimpan" do
    csv = <<~CSV
      email,periode,bagian,wahana,mulai,selesai,preseptor
      siti@example.com,#{@period.name},Ilmu Saraf,RSUD Kota,2026-10-12,20/12/2026,wati@example.com
      2206000101,#{@period.name},Anestesi,RSUD Kota,2026-10-12,2026-12-20,
    CSV

    assert_no_difference "ClinicalRotation.count" do
      matches = rotation_import(csv).matches
      assert_equal [ true, true ], matches.map(&:eligible?)
      assert_equal [ "baru", "baru" ], matches.map(&:action)
      assert_equal users(:wati), matches.first.supervisor
      assert_equal Date.new(2026, 12, 20), matches.first.end_date
      assert_equal @siti, matches.last.student
    end
  end

  test "terapkan menyimpan baris siap dan melewati baris bermasalah" do
    csv = <<~CSV
      email,periode,bagian,wahana,mulai,selesai,preseptor
      siti@example.com,#{@period.name},Ilmu Saraf,RSUD Kota,2026-10-12,2026-12-20,wati@example.com
      hantu@example.com,#{@period.name},Ilmu Saraf,RSUD Kota,2026-10-12,2026-12-20,
      budi@example.com,#{@period.name},Ilmu Saraf,RSUD Kota,2026-10-12,2026-12-20,
      siti@example.com,Periode Keliru,Anestesi,RSUD Kota,2026-10-12,2026-12-20,
      siti@example.com,#{@period.name},Radiologi,RSUD Kota,bukan-tanggal,2026-12-20,
      siti@example.com,#{@period.name},Forensik,RSUD Kota,2026-12-20,2026-10-12,
      siti@example.com,#{@period.name},Jiwa,RSUD Kota,2026-10-12,2026-12-20,hantu@example.com
      siti@example.com,#{@period.name},Kulit,RSUD Kota,2026-10-12,2026-12-20,dedi@example.com
      siti@example.com,#{@period.name},ilmu saraf,RSUD Kota,2026-10-12,2026-12-20,
    CSV
    importer = rotation_import(csv)
    notes = importer.matches.map(&:note)

    assert_equal "siap", notes[0]
    assert_match "mahasiswa tidak ditemukan", notes[1]
    assert_match "bukan mahasiswa", notes[2]
    assert_match "periode \"Periode Keliru\" tidak dikenal", notes[3]
    assert_match "tidak dikenali", notes[4]
    assert notes[5].present? && notes[5] != "siap", "tanggal selesai sebelum mulai harus ditolak model"
    assert_match "tidak ditemukan", notes[6]
    assert_match "tidak berperan", notes[7]
    assert_match "dobel", notes[8]

    result = nil
    assert_difference "ClinicalRotation.count", 1 do
      result = importer.apply!
    end
    assert_equal [ 1, 0, 8 ], [ result.created, result.updated, result.skipped ]
    rotation = ClinicalRotation.order(:id).last
    assert_equal [ @siti, @period, users(:wati) ], [ rotation.user, rotation.academic_period, rotation.preceptor ]
  end

  test "unggah ulang memperbarui, bukan menggandakan, dan kosong tidak menghapus nilai lama" do
    rotation = clinical_rotations(:ongoing_rotation_siti)
    csv = <<~CSV
      email,periode,bagian,wahana,mulai,selesai,preseptor
      siti@example.com,#{@period.name},#{rotation.station_name.upcase},RS Baru,,,
    CSV

    assert_no_difference "ClinicalRotation.count" do
      importer = rotation_import(csv)
      assert_equal "diperbarui", importer.matches.first.action
      assert_equal 1, importer.apply!.updated
    end
    rotation.reload
    assert_equal "RS Baru", rotation.institution_name
    assert_equal users(:budi), rotation.preceptor
    assert_equal 3.days.ago.to_date, rotation.start_date
  end

  test "periode dari form dipakai bila kolomnya kosong; tanpa keduanya ditolak" do
    csv = "email,bagian,mulai,selesai\nsiti@example.com,Ilmu Saraf,2026-10-12,2026-12-20\n"
    assert_match "periode kosong", rotation_import(csv).matches.first.note
    assert_equal @period, rotation_import(csv, default_period: @period).matches.first.period
  end

  test "akun nonaktif tidak bisa ditempatkan" do
    @siti.update_column(:deactivated_at, Time.current)
    csv = "email,periode,bagian,mulai,selesai\nsiti@example.com,#{@period.name},Saraf,2026-10-12,2026-12-20\n"
    assert_match "nonaktif", rotation_import(csv).matches.first.note
  end

  test "kolom wajib yang hilang dan berkas rusak dilaporkan" do
    assert_raises(PlacementCsvImport::Error) { rotation_import("periode,bagian\nA,B\n").matches }
    assert_raises(PlacementCsvImport::Error) { rotation_import("email,periode\na@b.c,X\n").matches }
    assert_raises(PlacementCsvImport::Error) { rotation_import("email,bagian\n\"a,B\n").matches }
  end

  test "pemisah titik koma dan BOM dari Excel diterima" do
    csv = "﻿email;periode;bagian;mulai;selesai\nsiti@example.com;#{@period.name};Saraf;12/10/2026;20/12/2026\n"
    assert rotation_import(csv).matches.first.eligible?
  end

  test "enrolment: tutor harus dosen, dan unggah ulang tidak melanggar keunikan blok" do
    enrollment = tutorial_enrollments.first
    student_email = enrollment.user.email
    csv = <<~CSV
      email,periode,blok,kelompok,mulai,selesai,tutor
      #{student_email},#{enrollment.academic_period.name},#{enrollment.block_name},Kelompok 9,,,budi@example.com
      #{student_email},#{enrollment.academic_period.name},Blok Baru,Kelompok 1,2026-10-05,2026-11-27,wati@example.com
    CSV
    importer = TutorialEnrollmentCsvImport.new(csv: csv)

    assert_equal "diperbarui", importer.matches.first.action
    assert importer.matches.first.eligible?
    assert_match "tidak berperan dosen", importer.matches.last.note
    assert_no_difference("TutorialEnrollment.count") { importer.apply! }
    assert_equal "Kelompok 9", enrollment.reload.group_name
  end
end
