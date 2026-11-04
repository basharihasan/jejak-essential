import { Controller } from "@hotwired/stimulus"

// Pratinjau langsung tema & ukuran huruf di halaman Pengaturan sebelum
// disimpan — memanggil window.applyAhsTheme/FontSize dari skrip layout.
// Pengganti atribut onchange inline yang diblokir Content Security Policy.
export default class extends Controller {
  theme(event) {
    window.applyAhsTheme?.(event.target.value)
  }

  fontSize(event) {
    window.applyAhsFontSize?.(event.target.value)
  }
}
