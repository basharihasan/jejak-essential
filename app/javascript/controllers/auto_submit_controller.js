import { Controller } from "@hotwired/stimulus"

// Mengirim formulir begitu nilainya berubah (pemilih peran aktif, penyaring
// periode/prodi). Pengganti atribut onchange="this.form.requestSubmit()" yang
// diblokir Content Security Policy.
export default class extends Controller {
  submit() {
    this.element.requestSubmit()
  }
}
