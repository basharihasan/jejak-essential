require "test_helper"

class StudyProgramTest < ActiveSupport::TestCase
  test "menolak program studi melebihi batas" do
    assert_equal StudyProgram::MAX_COUNT, StudyProgram.count
    assert StudyProgram.at_max_count?

    third = StudyProgram.new(name: "Kebidanan", code: "pskb", level: "sarjana")
    assert_not third.save
    assert_match "dikunci maksimal #{StudyProgram::MAX_COUNT}", third.errors.full_messages.to_sentence
    assert_equal StudyProgram::MAX_COUNT, StudyProgram.count
  end

  test "prodi yang ada tetap dapat disunting di batas" do
    assert study_programs(:sarjana_kedokteran).update(name: "Sarjana Kedokteran Umum")
  end

  test "menambah lagi diizinkan saat jumlah di bawah batas" do
    study_programs(:profesi_dokter).destroy
    assert_equal StudyProgram::MAX_COUNT - 1, StudyProgram.count
    assert_not StudyProgram.at_max_count?
    assert StudyProgram.new(name: "Kebidanan", code: "pskb", level: "sarjana").save
  end

  test "kode wajib unik dan huruf kecil" do
    program = StudyProgram.new(name: "Prodi Baru", code: "PSSK", level: "sarjana")
    program.valid?
    assert program.errors[:code].any?, "kode huruf besar harus ditolak"
  end
end
