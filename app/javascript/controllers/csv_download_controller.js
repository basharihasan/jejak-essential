import { Controller } from "@hotwired/stimulus"

// Mengunduh isi <table> sebagai CSV langsung dari peramban — dipakai untuk
// data yang sengaja tidak disimpan di server (mis. kata sandi sementara hasil
// impor pengguna), jadi tidak ada endpoint unduhan yang bisa dibuka ulang.
export default class extends Controller {
  static targets = ["table"]
  static values = { filename: { type: String, default: "data.csv" } }

  download() {
    const rows = Array.from(this.tableTarget.querySelectorAll("tr")).map((tr) =>
      Array.from(tr.querySelectorAll("th, td")).map((cell) => this.escape(cell.textContent.trim())).join(",")
    )
    // BOM supaya Excel membaca UTF-8 (nama berhuruf non-ASCII) dengan benar.
    const blob = new Blob(["﻿" + rows.join("\r\n")], { type: "text/csv;charset=utf-8" })
    const url = URL.createObjectURL(blob)
    const link = document.createElement("a")
    link.href = url
    link.download = this.filenameValue
    document.body.appendChild(link)
    link.click()
    link.remove()
    URL.revokeObjectURL(url)
  }

  escape(value) {
    // Cegah injeksi rumus spreadsheet dan kutip nilai yang berisi pemisah.
    const safe = /^[=+\-@]/.test(value) ? `'${value}` : value
    return /[",\r\n]/.test(safe) ? `"${safe.replace(/"/g, '""')}"` : safe
  }
}
