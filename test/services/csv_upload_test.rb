require "test_helper"

class CsvUploadTest < ActiveSupport::TestCase
  test "UTF-8 dibiarkan apa adanya dan BOM Excel dibuang" do
    assert_equal "nama\nJosé\n", CsvUpload.decode("﻿nama\nJosé\n")
  end

  test "berkas simpanan Excel Windows (Windows-1252) dibaca dengan aksennya utuh" do
    raw = "nama\nBehçet\n".encode("Windows-1252").b

    text = CsvUpload.decode(raw)
    assert text.valid_encoding?
    assert_equal Encoding::UTF_8, text.encoding
    assert_equal "nama\nBehçet\n", text
  end

  test "byte yang tak terdefinisi di Windows-1252 dibuang, bukan melempar galat" do
    raw = "email\nx\x81y@contoh.test\n".b

    text = CsvUpload.decode(raw)
    assert text.valid_encoding?
    assert_equal "email\nxy@contoh.test\n", text
  end

  test "nil menjadi string kosong" do
    assert_equal "", CsvUpload.decode(nil)
  end
end
