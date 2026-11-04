# frozen_string_literal: true

# Isi berkas CSV unggahan → String UTF-8 yang sah, tanpa BOM. Dipakai semua
# importer CSV supaya berkas simpanan Excel Windows (Windows-1252 — nama
# beraksen seperti "José" atau "Behçet") terbaca sama di mana pun, bukan
# ditolak di satu importer dan diterima di importer lain.
#
# Windows-1252 tidak mendefinisikan lima byte (0x81, 0x8D, 0x8F, 0x90, 0x9D);
# byte itu dibuang alih-alih melempar Encoding::UndefinedConversionError,
# yang sebelumnya lolos sebagai galat 500 dari unggahan berkas rusak.
module CsvUpload
  BOM = "﻿"

  module_function

  def decode(raw)
    text = raw.to_s.dup.force_encoding(Encoding::UTF_8)
    unless text.valid_encoding?
      text = raw.to_s.dup.force_encoding(Encoding::Windows_1252)
                .encode(Encoding::UTF_8, invalid: :replace, undef: :replace, replace: "")
    end
    text.delete_prefix(BOM)
  end
end
