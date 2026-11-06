# Panduan Penggunaan JEJAK Essential

JEJAK Essential adalah aplikasi pencatatan perjalanan belajar klinis yang berdiri sendiri: logbook kegiatan, logbook kasus klinis, rotasi klinik dan enrolment tutorial, asesmen (DOPS, Mini-CEX, ujian tulis/praktik, rubrik penguji, CBD/Long Case), pemetaan capaian kompetensi & EPA, tugas akhir, serta dashboard analitik untuk pembimbing dan program studi.

Panduan ini disusun menurut **peran**: bab awal berlaku untuk semua orang, lalu bab khusus mahasiswa, bab khusus pembimbing (dosen, preseptor, kaprodi), dan bab khusus admin. Bagian akhir memuat catatan privasi data pasien, notifikasi, pertanyaan yang sering diajukan, dan daftar alamat halaman.

Kaprodi dan admin prodi yang baru menerima aplikasi dapat mulai dari [Panduan Penyiapan](#panduan-penyiapan-untuk-kaprodi--admin-prodi).

> **Cara membaca panduan ini.** Nama menu ditulis **tebal** persis seperti di sidebar (mis. **Logbook → Kasus Klinis**). Alamat halaman ditulis dengan huruf mesin, mis. `/clinical_cases`. Bila admin instansi Anda mengganti label menu lewat **Taksonomi Istilah**, nama yang Anda lihat bisa berbeda dari yang tertulis di sini — alamat halamannya tetap sama.

## Daftar Isi

<!-- TOC:START -->
- [Panduan Penyiapan untuk Kaprodi & Admin Prodi](#panduan-penyiapan-untuk-kaprodi--admin-prodi)
  - [Alur penyiapan](#alur-penyiapan)
  - [Siapa mengerjakan apa](#siapa-mengerjakan-apa)
  - [Yang perlu disiapkan dulu](#yang-perlu-disiapkan-dulu)
  - [Tahap 0 — Pasang aplikasi dan buat admin pertama](#tahap-0--pasang-aplikasi-dan-buat-admin-pertama)
  - [Tahap 1 — Masuk dan periksa isi bawaan](#tahap-1--masuk-dan-periksa-isi-bawaan)
  - [Tahap 2 — Periode akademik dan program studi](#tahap-2--periode-akademik-dan-program-studi)
  - [Tahap 3 — Buat akun pengguna](#tahap-3--buat-akun-pengguna)
  - [Tahap 4 — Kurikulum: kompetensi, target, dan master data](#tahap-4--kurikulum-kompetensi-target-dan-master-data)
  - [Tahap 5 — Tempatkan mahasiswa](#tahap-5--tempatkan-mahasiswa)
  - [Tahap 6 — Siapkan asesmen](#tahap-6--siapkan-asesmen)
  - [Tahap 7 — Uji coba satu putaran](#tahap-7--uji-coba-satu-putaran)
  - [Tahap 8 — Luncurkan ke dosen dan mahasiswa](#tahap-8--luncurkan-ke-dosen-dan-mahasiswa)
  - [Tahap 9 — Kerja rutin setelah berjalan](#tahap-9--kerja-rutin-setelah-berjalan)
  - [Bila ada kendala](#bila-ada-kendala)
- [Bab 1 — Memulai](#bab-1--memulai)
  - [1.1 Mendaftar akun](#mendaftar-akun)
  - [1.2 Masuk, lupa kata sandi, keluar](#masuk-lupa-kata-sandi-keluar)
  - [1.3 Melengkapi profil](#melengkapi-profil)
- [Bab 2 — Mengenal Antarmuka](#bab-2--mengenal-antarmuka)
  - [2.1 Anatomi layar](#anatomi-layar)
  - [2.2 Grup menu sidebar](#grup-menu-sidebar)
  - [2.3 Ganti peran](#ganti-peran)
  - [2.4 Tema, ukuran huruf, dan bahasa](#tema-ukuran-huruf-dan-bahasa)
  - [2.5 Pencarian](#pencarian)
  - [2.6 Notifikasi](#notifikasi)
- [Bab 3 — Peran dan Hak Akses](#bab-3--peran-dan-hak-akses)
- [Bab 4 — Panduan Mahasiswa](#bab-4--panduan-mahasiswa)
  - [4.1 Beranda mahasiswa](#beranda-mahasiswa)
  - [4.2 Logbook Kegiatan](#logbook-kegiatan)
  - [4.3 Logbook Kasus Klinis](#logbook-kasus-klinis)
  - [4.4 Longitudinal Portfolio](#longitudinal-portfolio)
  - [4.5 Rotasi Klinik dan Enrolment Tutorial](#rotasi-klinik-dan-enrolment-tutorial)
  - [4.6 Refleksi](#refleksi)
  - [4.7 Tugas Akhir](#tugas-akhir)
  - [4.8 Evaluasi Akademik (nilai ujian)](#evaluasi-akademik-nilai-ujian)
  - [4.9 Workplace Assessment (DOPS & Mini-CEX)](#workplace-assessment-dops--mini-cex)
  - [4.10 Rubric-based Assessment (Asesmen Saya)](#rubric-based-assessment-asesmen-saya)
  - [4.11 Jurnal Umpan Balik](#jurnal-umpan-balik)
  - [4.12 Formulir evaluasi (Assessment Form)](#formulir-evaluasi-assessment-form)
  - [4.13 Peta Kompetensi (Analisis Capaian Pembelajaran)](#peta-kompetensi-analisis-capaian-pembelajaran)
  - [4.14 Peta EPA & Tingkat Entrustment](#peta-epa--tingkat-entrustment)
  - [4.15 Kesehatan Mental (SRQ-20)](#kesehatan-mental-srq-20)
- [Bab 5 — Panduan Pembimbing (Dosen, Preseptor, Kaprodi)](#bab-5--panduan-pembimbing-dosen-preseptor-kaprodi)
  - [5.1 Beranda pembimbing](#beranda-pembimbing)
  - [5.2 Validasi Kasus Klinis](#validasi-kasus-klinis)
  - [5.3 Validasi Kegiatan](#validasi-kegiatan)
  - [5.4 Menilai DOPS dan Mini-CEX](#menilai-dops-dan-mini-cex)
  - [5.5 Lembar Penguji (rubrik, CBD, Long Case)](#lembar-penguji-rubrik-cbd-long-case)
  - [5.6 Tugas Akhir: membimbing dan menguji](#tugas-akhir-membimbing-dan-menguji)
  - [5.7 Memutuskan tingkat EPA](#memutuskan-tingkat-epa)
  - [5.8 Dashboard Analitik](#dashboard-analitik)
  - [5.9 Daftar Mahasiswa](#daftar-mahasiswa)
  - [5.10 Khusus kaprodi](#khusus-kaprodi)
  - [5.11 Monitoring SRQ](#monitoring-srq)
- [Bab 6 — Panduan Admin (Konfigurasi)](#bab-6--panduan-admin-konfigurasi)
  - [6.1 Tahun/Periode Akademik](#tahunperiode-akademik)
  - [6.2 Program Studi](#program-studi)
  - [6.3 Pengguna & impor CSV](#pengguna--impor-csv)
  - [6.4 Relabel Prodi Mahasiswa](#relabel-prodi-mahasiswa)
  - [6.5 Assessment Events dan impor nilai](#assessment-events-dan-impor-nilai)
  - [6.6 Jadwal DOPS & Mini-CEX](#jadwal-dops--mini-cex)
  - [6.7 Kerangka Kompetensi](#kerangka-kompetensi)
  - [6.8 Blueprint Asesmen](#blueprint-asesmen)
  - [6.9 Learning Unit & Matrix](#learning-unit--matrix)
  - [6.10 Target Kasus Logbook](#target-kasus-logbook)
  - [6.11 Domain Kegiatan Akademik](#domain-kegiatan-akademik)
  - [6.12 Master Diagnosis, Keterampilan, Obat](#master-diagnosis-keterampilan-obat)
  - [6.13 Assessment Form Builder (templat formulir)](#assessment-form-builder-templat-formulir)
  - [6.14 Rotasi Klinik dan Enrolment Tutorial](#rotasi-klinik-dan-enrolment-tutorial-1)
  - [6.15 Taksonomi Istilah](#taksonomi-istilah)
  - [6.16 Data Governance](#data-governance)
  - [6.17 Ekspor Data (CSV)](#ekspor-data-csv)
- [Bab 7 — Privasi & Keamanan Data Pasien](#bab-7--privasi--keamanan-data-pasien)
- [Bab 8 — Notifikasi](#bab-8--notifikasi)
- [Bab 9 — Bagaimana Data Mengalir ke Capaian](#bab-9--bagaimana-data-mengalir-ke-capaian)
- [Bab 10 — Pertanyaan yang Sering Diajukan](#bab-10--pertanyaan-yang-sering-diajukan)
- [Bab 11 — Pindah ke jejak.pro](#bab-11--pindah-ke-jejakpro)
- [Lampiran A — Daftar Alamat Halaman](#lampiran-a--daftar-alamat-halaman)
- [Lampiran B — Glosarium](#lampiran-b--glosarium)
<!-- TOC:END -->

---

## Panduan Penyiapan untuk Kaprodi & Admin Prodi

> **Untuk siapa.** Kaprodi dan admin prodi yang baru menerima aplikasi ini. Mahasiswa, dosen, dan preseptor dapat langsung ke [Bab 1](#bab-1--memulai).

Bagian ini memandu Anda dari aplikasi kosong sampai mahasiswa dan dosen siap memakainya. Seluruh urutannya sudah dijalankan pada instalasi baru, dan semua screenshot berasal dari percobaan itu dengan nama dan data fiktif. Rincian tiap menu ada di [Bab 5](#bab-5--panduan-pembimbing-dosen-preseptor-kaprodi) dan [Bab 6](#bab-6--panduan-admin-konfigurasi).

### Alur penyiapan

<svg class="dg" viewBox="0 0 760 318" role="img" aria-label="Alur penyiapan sepuluh tahap, dari pemasangan aplikasi sampai kerja rutin">
  <defs><marker id="ar-mulai" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <rect x="10" y="10" width="170" height="66" rx="10" class="dg-box-gray"/>
  <text x="95" y="32" class="dg-t dg-b" text-anchor="middle">Tahap 0 · IT</text>
  <text x="95" y="49" class="dg-ts" text-anchor="middle">Pasang aplikasi,</text>
  <text x="95" y="63" class="dg-ts" text-anchor="middle">buat admin pertama</text>
  <rect x="200" y="10" width="170" height="66" rx="10" class="dg-box"/>
  <text x="285" y="32" class="dg-t dg-b" text-anchor="middle">Tahap 1 · Admin</text>
  <text x="285" y="49" class="dg-ts" text-anchor="middle">Masuk, periksa</text>
  <text x="285" y="63" class="dg-ts" text-anchor="middle">isi bawaan</text>
  <rect x="390" y="10" width="170" height="66" rx="10" class="dg-box"/>
  <text x="475" y="32" class="dg-t dg-b" text-anchor="middle">Tahap 2 · Admin</text>
  <text x="475" y="49" class="dg-ts" text-anchor="middle">Periode akademik</text>
  <text x="475" y="63" class="dg-ts" text-anchor="middle">dan program studi</text>
  <rect x="580" y="10" width="170" height="66" rx="10" class="dg-box"/>
  <text x="665" y="32" class="dg-t dg-b" text-anchor="middle">Tahap 3 · Admin</text>
  <text x="665" y="49" class="dg-ts" text-anchor="middle">Akun, prodi kaprodi,</text>
  <text x="665" y="63" class="dg-ts" text-anchor="middle">NPM dan angkatan</text>
  <rect x="580" y="110" width="170" height="66" rx="10" class="dg-box-amber"/>
  <text x="665" y="132" class="dg-t dg-b" text-anchor="middle">Tahap 4 · Bersama</text>
  <text x="665" y="149" class="dg-ts" text-anchor="middle">Kompetensi, target kasus,</text>
  <text x="665" y="163" class="dg-ts" text-anchor="middle">master data</text>
  <rect x="390" y="110" width="170" height="66" rx="10" class="dg-box"/>
  <text x="475" y="132" class="dg-t dg-b" text-anchor="middle">Tahap 5 · Admin</text>
  <text x="475" y="149" class="dg-ts" text-anchor="middle">Rotasi klinik dan</text>
  <text x="475" y="163" class="dg-ts" text-anchor="middle">enrolment tutorial</text>
  <rect x="200" y="110" width="170" height="66" rx="10" class="dg-box-amber"/>
  <text x="285" y="132" class="dg-t dg-b" text-anchor="middle">Tahap 6 · Bersama</text>
  <text x="285" y="149" class="dg-ts" text-anchor="middle">Event, nilai,</text>
  <text x="285" y="163" class="dg-ts" text-anchor="middle">Learning Unit, jadwal</text>
  <rect x="10" y="110" width="170" height="66" rx="10" class="dg-box-amber"/>
  <text x="95" y="132" class="dg-t dg-b" text-anchor="middle">Tahap 7 · Bersama</text>
  <text x="95" y="149" class="dg-ts" text-anchor="middle">Uji coba satu putaran</text>
  <text x="95" y="163" class="dg-ts" text-anchor="middle">dengan orang sungguhan</text>
  <rect x="10" y="210" width="170" height="66" rx="10" class="dg-box-green"/>
  <text x="95" y="232" class="dg-t dg-b" text-anchor="middle">Tahap 8 · Kaprodi</text>
  <text x="95" y="249" class="dg-ts" text-anchor="middle">Luncurkan: dosen dulu,</text>
  <text x="95" y="263" class="dg-ts" text-anchor="middle">lalu mahasiswa</text>
  <rect x="200" y="210" width="170" height="66" rx="10" class="dg-box-green"/>
  <text x="285" y="232" class="dg-t dg-b" text-anchor="middle">Tahap 9 · Rutin</text>
  <text x="285" y="249" class="dg-ts" text-anchor="middle">Pantau, nilai,</text>
  <text x="285" y="263" class="dg-ts" text-anchor="middle">periode berikutnya</text>
  <line x1="180" y1="43" x2="198" y2="43" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="370" y1="43" x2="388" y2="43" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="560" y1="43" x2="578" y2="43" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="665" y1="76" x2="665" y2="108" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="580" y1="143" x2="562" y2="143" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="390" y1="143" x2="372" y2="143" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="200" y1="143" x2="182" y2="143" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="95" y1="176" x2="95" y2="208" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <line x1="180" y1="243" x2="198" y2="243" class="dg-arrow" marker-end="url(#ar-mulai)"/>
  <rect x="400" y="218" width="14" height="14" rx="3" class="dg-box-gray"/><text x="420" y="229" class="dg-lbl">Pengelola server (IT)</text>
  <rect x="580" y="218" width="14" height="14" rx="3" class="dg-box"/><text x="600" y="229" class="dg-lbl">Admin</text>
  <rect x="400" y="244" width="14" height="14" rx="3" class="dg-box-green"/><text x="420" y="255" class="dg-lbl">Kaprodi</text>
  <rect x="580" y="244" width="14" height="14" rx="3" class="dg-box-amber"/><text x="600" y="255" class="dg-lbl">Kaprodi + admin</text>
  <text x="380" y="304" class="dg-lbl" text-anchor="middle">Kerjakan berurutan: rotasi memerlukan periode dan akun, event memerlukan periode, dan nilai hanya masuk ke akun yang sudah ada.</text>
</svg>

### Siapa mengerjakan apa

| Pekerjaan | Pengelola server (IT) | Admin | Kaprodi |
|---|---|---|---|
| Memasang aplikasi, akun admin pertama, pencadangan | Ya | | |
| Periode, pengguna, rotasi, enrolment | | Ya | Menyediakan data |
| Kerangka kompetensi, target kasus, master data | | Memasukkan | Menetapkan isi |
| Event asesmen dan impor nilai | | Ya | Menetapkan jadwal |
| Learning Unit, Jadwal DOPS & Mini-CEX, Relabel Prodi | | Semua prodi | Prodi sendiri |
| Assessment Form Builder | | Ya | Ya |
| Dashboard Analitik, Ekspor Data | | Semua prodi | Prodi sendiri |
| Pendaftaran mandiri, nonaktifkan atau hapus akun | | Ya | |
| Mengaktifkan dan memantau SRQ-20 | | Tidak ada akses | Prodi sendiri |

Tiga hal yang sering keliru dipahami:

- **Peran Admin berlaku untuk seluruh instalasi.** Belum ada admin khusus satu prodi, jadi setiap admin dapat membuka data semua prodi.
- **Bila satu orang merangkap kaprodi dan admin,** beri peran `kaprodi+admin` dan isi prodinya. Menu **Monitoring SRQ** baru tampil saat **Peran Aktif** di topbar diganti ke Kaprodi.
- **Kaprodi memantau, tidak memverifikasi.** Tanpa peran dosen, kaprodi tidak dapat membuka rincian kasus, dan menu **Rotasi Klinik** serta **Kasus Klinis**-nya memang kosong. Pantau lewat **Dashboard Analitik**, **Daftar Mahasiswa**, dan **Ekspor Data**. Kaprodi yang juga membimbing diberi peran `dosen+kaprodi`.

### Yang perlu disiapkan dulu

Siapkan bahan ini sebelum membuka aplikasi supaya penyiapan tidak terhenti di tengah.

| Bahan | Disiapkan oleh | Dipakai di |
|---|---|---|
| Alamat aplikasi, HTTPS, jadwal pencadangan | IT | Tahap 0 |
| Kalender akademik: nama dan tanggal tiap periode | Kaprodi | Tahap 2 |
| Daftar pengguna: email aktif, nama, peran, prodi | Admin | Tahap 3 |
| NPM dan angkatan seluruh mahasiswa | Admin | Tahap 3 |
| Cara menyampaikan kata sandi sementara secara pribadi, dan satu kontak bantuan | Admin | Tahap 3 dan 8 |
| Kerangka kompetensi atau EPA, beserta target skornya | Kaprodi | Tahap 4 |
| Target jumlah kasus FKTP dan FKRTL | Kaprodi | Tahap 4 |
| Penempatan tiap mahasiswa, sebaiknya satu berkas. Profesi: stase, wahana, preseptor, tanggal. Sarjana: blok, kelompok, tutor | Kaprodi | Tahap 5 |
| Daftar ujian dan bobot nilai tiap blok atau stase | Kaprodi | Tahap 6 |
| Aturan data pasien: kapan meminta persetujuan pasien, dan larangan menulis identitas di kolom bebas | Kaprodi | Tahap 8 |
| SRQ-20: tinjauan rumusan butir oleh ahli konten, kesepakatan ambang skor, SOP untuk hasil "Perlu Perhatian Segera", dan nomor konselor | Kaprodi | Sebelum mengaktifkan SRQ-20 di Tahap 8 |

### Tahap 0 — Pasang aplikasi dan buat admin pertama

*Dikerjakan pengelola server.*

1. Pasang aplikasi mengikuti `NAS_DEPLOY.md` di repositori. Data rujukan terisi otomatis saat basis data pertama kali dibuat.
2. Buat akun admin pertama. Halaman **Daftar** hanya menghasilkan akun Mahasiswa, jadi pilih salah satu cara:
   - **Lewat `.env`, tanpa terminal.** Isi `ADMIN_EMAIL` dan `ADMIN_PASSWORD` sebelum kontainer dijalankan. Akun dibuat sekali selama belum ada admin sama sekali, dan kata sandinya wajib diganti saat masuk pertama. Kosongkan `ADMIN_PASSWORD` sesudahnya.
   - **Lewat terminal,** dengan perintah berikut:

~~~
docker compose exec \
  -e ADMIN_EMAIL=admin@kampus.ac.id \
  -e ADMIN_PASSWORD='kata-sandi-kuat' \
  -e ADMIN_NAME='Nama Admin' \
  web bin/rails users:create_admin
~~~

{:start="3"}
3. Cadangkan secara rutin: basis data, volume unggahan `jejak_lite_storage`, dan berkas `.env`. Tanpa kunci enkripsi di `.env`, identitas pasien tidak dapat dibaca lagi.
4. Tentukan layanan tambahan. Compose bawaan tidak meneruskan pengaturannya ke aplikasi, jadi tambahkan variabelnya ke bagian `environment` layanan `web` bila diperlukan:

| Layanan | Variabel | Bila tidak diisi |
|---|---|---|
| Email | `SMTP_*` | Tautan *Lupa kata sandi* disembunyikan, dan admin yang me-reset kata sandi |
| Login Google | `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET` | Tombol **Masuk dengan Google** tidak tampil |
| Notifikasi push | `VAPID_*` | Notifikasi hanya muncul di dalam aplikasi |

> **Jangan jalankan `bin/rails demo:seed` di server sungguhan.** Perintah itu membuat akun contoh, termasuk Admin, yang bebas dari kewajiban ganti kata sandi. Di mode produksi ia ditolak, kecuali diminta khusus untuk instance percobaan dengan `ALLOW_DEMO_DATA=1` dan `DEMO_PASSWORD`.

**Selesai bila:** halaman Masuk terbuka dari komputer kampus, dan admin dapat masuk.

### Tahap 1 — Masuk dan periksa isi bawaan

*Dikerjakan admin.*

1. Masuk dengan akun admin. Bila akun dibuat lewat `.env`, Anda langsung diminta membuat kata sandi baru. Bila dibuat orang lain lewat terminal, ganti sendiri lewat **Pengaturan Akun**.
2. Beranda menampilkan **Langkah Penyiapan**: daftar pekerjaan yang dihitung dari data sungguhan. Kerjakan dari atas lewat tautan **Kerjakan** pada tiap baris. Panel ini hilang sendiri setelah semua langkah wajib selesai, dan langkah bertanda *Dianjurkan* tidak menahannya. Kaprodi melihat panel serupa untuk prodinya.

![Beranda admin pada instalasi baru: panel Langkah Penyiapan berisi delapan langkah, dan semua angka ringkasan nol](panduan/mulai-01-beranda-admin.png)

Instalasi baru sudah berisi data contoh, dan pendaftaran mandirinya tertutup. Cocokkan dengan daftar ini:

| Sudah terisi sebagai contoh | Masih kosong |
|---|---|
| 2 program studi (Sarjana Kedokteran, Profesi Dokter) | Periode akademik |
| 1 kerangka kompetensi dengan 7 ranah | Pengguna selain admin |
| 11 domain kegiatan | Rotasi dan enrolment |
| 42 diagnosis, 25 keterampilan, 44 obat | Target kasus |
| 3 formulir evaluasi, 1 blueprint | Event asesmen dan Learning Unit |

### Tahap 2 — Periode akademik dan program studi

*Dikerjakan admin.*

1. Buka **Konfigurasi → Tahun/Periode Akademik**, klik **+ Periode Baru**, isi nama (mis. `2026/2027 Ganjil`) dan tanggalnya, lalu **Simpan**.
2. Hindari periode yang tumpang tindih. Semester pada logbook hanya terisi otomatis bila tepat satu periode mencakup tanggal kegiatan.
3. Buka **Konfigurasi → Program Studi**. Sunting nama bila perlu, dan catat kodenya (`pssk`, `pspd`) karena dipakai di berkas CSV.

![Formulir Periode Baru dengan nama dan tanggal terisi](panduan/mulai-02-periode.png)

**Selesai bila:** periode berjalan tampil di daftar dan tanggal hari ini berada di dalamnya.

### Tahap 3 — Buat akun pengguna

*Dikerjakan admin.*

**Langkah 1: siapkan berkas pengguna.** Satu baris per orang, dapat disimpan dari Excel sebagai CSV:

~~~
email,nama,peran,prodi
kaprodi.pspd@kampus.ac.id,"dr. Hendra Wijaya, Sp.PD",kaprodi,pspd
ari.nugroho@kampus.ac.id,"dr. Ari Nugroho, Sp.B",dosen+preseptor,pspd
annisa.putri@kampus.ac.id,Annisa Putri,mahasiswa,pspd
~~~

- **Peran:** `mahasiswa`, `dosen`, `preseptor`, `kaprodi`, atau `admin`. Gabungkan dengan `+`.
- **Prodi wajib diisi pada baris kaprodi,** karena itulah batas aksesnya. Baris kaprodi tanpa prodi ditolak.
- Beri tanda kutip pada nama yang memuat koma, seperti contoh di atas.

**Langkah 2: impor.** Buka **Konfigurasi → Pengguna → Impor CSV**, pilih berkas, lalu klik **Impor**.

**Langkah 3: periksa hasilnya, dan unduh kata sandi sementara saat itu juga.** Klik **Unduh CSV** pada kotak *Kata sandi sementara akun baru*. Daftar ini hanya tampil sekali. Bila terlewat, buka **Pengguna → Sunting → Reset Kata Sandi** untuk tiap akun. Baris yang gagal disebutkan alasannya: perbaiki, lalu unggah baris itu saja.

![Hasil impor: akun baru, satu baris kaprodi tanpa prodi ditolak dengan alasannya, dan tabel kata sandi sementara dengan tombol Unduh CSV](panduan/mulai-03-impor-hasil.png)

**Langkah 4: isi NPM dan angkatan secara massal.** Berkas impor tidak memuat kolom ini. Mahasiswa dapat mengisinya sendiri di profil, tetapi lebih rapi diisi admin lewat **Konfigurasi → Relabel Prodi Mahasiswa**:

1. Siapkan CSV berkolom `email,npm,angkatan`, satu berkas per prodi.
2. Pilih **Prodi tujuan** yang sama dengan prodi mahasiswa itu sekarang, lalu klik **Pratinjau**.
3. Periksa kolom *Catatan*, lalu klik **Terapkan ke N akun** dan setujui konfirmasinya.

![Pratinjau relabel: empat mahasiswa berstatus siap dengan NPM dan angkatan baru](panduan/mulai-06-relabel-pratinjau.png)

**Langkah 5: tentukan pendaftaran mandiri.** Halaman **Konfigurasi → Pengguna** menampilkan statusnya. Instalasi baru mulai **tertutup**: tautan *Daftar* disembunyikan, dan akun hanya dibuat lewat impor. Instalasi lama tetap terbuka sampai Anda menutupnya. Klik **Buka Pendaftaran** hanya bila mahasiswa memang boleh mendaftar sendiri, karena siapa pun yang tahu alamat aplikasi lalu dapat membuat akun Mahasiswa dan memilih prodi sendiri.

![Halaman Pengguna: status Pendaftaran mandiri Tertutup dengan tombol Buka Pendaftaran, dan daftar akun](panduan/mulai-04-pengguna.png)

**Bila ada akun yang keliru atau sudah tidak dipakai,** buka **Pengguna → Sunting**. Di halaman yang sama Anda juga dapat mengubah peran dan prodi, serta me-reset kata sandi.

- **Nonaktifkan Akun:** pengguna tidak dapat masuk, dan keluar dari daftar pilihan serta hitungan prodi. Rekam jejaknya tetap ada, dan akun dapat diaktifkan kembali.
- **Hapus Akun:** hanya tersedia untuk akun yang belum punya rekam jejak sama sekali, mis. salah daftar.

![Halaman sunting pengguna: nama, program studi, peran, Reset Kata Sandi, dan kartu Status akun dengan tombol Nonaktifkan dan Hapus](panduan/mulai-05-sunting-pengguna.png)

**Selesai bila:** semua orang ada di **Pengguna** dengan peran dan prodi yang benar. Kata sandi sementara baru dibagikan di Tahap 7 dan 8.

### Tahap 4 — Kurikulum: kompetensi, target, dan master data

*Kaprodi menetapkan isinya, admin memasukkannya. Kaprodi tidak punya akses ke menu-menu ini.*

1. **Kerangka kompetensi** (**Konfigurasi → Kerangka Kompetensi**). Sesuaikan kerangka contoh, atau buat kerangka baru: tambah atau hapus ranah dan sub-kompetensi, lalu isi target skor per periode lewat **Set Target**.
2. **Kerangka Peta EPA tiap prodi** (**Konfigurasi → Program Studi → Sunting**). Pilih kerangka yang dipakai Peta EPA mahasiswa prodi itu dan pilihan EPA saat verifikasi kasus. Bila dikosongkan, dipakai kerangka yang paling awal dibuat.
3. **Target kasus** (**Konfigurasi → Target Kasus Logbook**). Buat satu target FKTP dan satu FKRTL per prodi. Kasus berlatar Pelayanan Primer dihitung FKTP, sisanya FKRTL. Tanpa target, kartu pemenuhan target tidak tampil bagi mahasiswa.
4. **Domain kegiatan** (**Konfigurasi → Domain Kegiatan Akademik**). Nonaktifkan yang tidak dipakai supaya form mahasiswa ringkas.
5. **Master data** (**Konfigurasi → Master Diagnosis, Keterampilan, Obat**). Tambahkan yang kurang, satu per satu atau lewat CSV. Kode ICD-10 dan level SKDI pada kasus terisi otomatis dari sini.
6. **Blueprint dan formulir contoh.** Pakai, sesuaikan, atau hapus. Rinciannya ada di [Blueprint Asesmen](#blueprint-asesmen) dan [Assessment Form Builder](#assessment-form-builder-templat-formulir).

![Kerangka kompetensi: tujuh ranah dengan sub-kompetensi dan pengisian target per periode](panduan/mulai-07-kerangka.png)

![Sunting Program Studi: pilihan Kerangka Peta EPA](panduan/mulai-08-prodi-epa.png)

![Daftar target kasus: FKTP 20 dan FKRTL 30 untuk Profesi Dokter](panduan/mulai-09-target.png)

**Selesai bila:** kerangka sudah sesuai kurikulum Anda, tiap prodi memilih kerangkanya, dan target tiap prodi terisi.

### Tahap 5 — Tempatkan mahasiswa

*Dikerjakan admin, dengan data dari kaprodi atau koordinator.*

Penempatan menautkan mahasiswa ke preseptor atau tutornya. Tanpa penempatan, preseptor dan tutor belum melihat mahasiswanya di Beranda dan Dashboard Analitik, dan mahasiswa tidak melihat rotasi atau bloknya.

Buka **Rotasi Klinik → Impor CSV** untuk Profesi Dokter, atau **Enrolment Tutorial → Impor CSV** untuk Sarjana Kedokteran. Siapkan satu baris per mahasiswa per stase atau blok. Template tersedia di halaman itu:

~~~
email,periode,bagian,wahana,mulai,selesai,preseptor
annisa.putri@kampus.ac.id,2026/2027 Ganjil,Ilmu Bedah,RSUD Kota,12/10/2026,20/12/2026,ari.nugroho@kampus.ac.id
~~~

Berkas enrolment memakai kolom `email,periode,blok,kelompok,mulai,selesai,tutor`.

1. Pilih berkas, lalu klik **Pratinjau**. Kolom *Catatan* menyebut tiap baris *baru*, *diperbarui*, atau alasan penolakannya, mis. salah ketik email.
2. Klik **Terapkan ke N baris** dan setujui konfirmasinya. Baris bermasalah dilewati.
3. Perbaiki baris yang dilewati, lalu unggah ulang seluruh berkas. Baris yang sudah masuk diperbarui, bukan digandakan.

![Pratinjau impor rotasi: tiga baris baru, satu preseptor salah ketik, dan satu mahasiswa tidak ditemukan](panduan/mulai-10-impor-rotasi.png)

Untuk satu atau dua mahasiswa, pakai **+ Tambah Rotasi** atau **+ Tambah Enrolment**.

> **Tulis nama stase dan blok secara seragam.** Nama blok pada event asesmen harus sama dengan nama stase atau blok di sini. Bila berbeda, event rubrik tidak tampil bagi mahasiswa.

![Daftar rotasi: empat mahasiswa dengan stase, preseptor, dan status Sedang Berlangsung](panduan/mulai-11-rotasi-daftar.png)

**Selesai bila:** setiap mahasiswa aktif punya penempatan pada periode berjalan.

### Tahap 6 — Siapkan asesmen

*Admin membuat event dan mengimpor nilai. Kaprodi menyusun Learning Unit.*

**Buat event** (admin). Buka **Konfigurasi → Assessment Events → + Event Baru**, isi nama, tipe, periode, prodi, blok, tanggal, dan nilai maksimum.

- Ubah **Status** ke **Terbit** saat event siap. Event berstatus Draf belum tampil bagi mahasiswa.
- Tipe menentukan cara nilai masuk: ujian tulis dan praktik lewat impor CSV, rubrik lewat Lembar Penguji, CBD dan Long Case dari kasus mahasiswa. Lihat [Assessment Events](#assessment-events-dan-impor-nilai).

![Formulir event baru: CBT Blok Kardiovaskular berstatus Terbit](panduan/mulai-12-event-form.png)

**Impor nilai** (admin), setelah ujian:

1. Buka event itu, lalu klik **Impor CSV** di halaman event.
2. Unggah CSV berkolom email dan nilai, lalu klik **Lanjut ke pemetaan kolom**.
3. Periksa pemetaan kolomnya, lalu klik **Jalankan impor**. Email yang tidak dikenal dilaporkan, bukan dibuatkan akun.

![Langkah pemetaan kolom: email dan skor total sudah terpetakan otomatis](panduan/mulai-13-impor-pemetaan.png)

> **Ada dua pintu impor.** Gunakan **Impor CSV** di halaman event untuk berkas biasa. Menu **Konfigurasi → Impor CSV CBT & OSCE** khusus untuk berkas berformat ekspor Glide.

**Susun Learning Unit** (kaprodi). Buka **Coaching Center → Learning Unit & Matrix → + Learning Unit**. Pada halaman unit, tambahkan event beserta bobotnya sampai total 100%. Nilai unit tiap mahasiswa terhitung otomatis.

![Assessment Matrix: event OSCE berbobot 100 persen dan rekap nilai per mahasiswa](panduan/mulai-14-learning-unit.png)

**Jadwalkan DOPS dan Mini-CEX** (kaprodi atau admin). Buka **Jadwal DOPS & Mini-CEX → + Jadwal Baru**. Mahasiswa dan penilai langsung mendapat notifikasi, dan jadwalnya masuk agenda.

![Formulir jadwal: DOPS jahit luka dengan mahasiswa dan penilai terpilih](panduan/mulai-15-jadwal.png)

**Selesai bila:** event semester berjalan terdaftar, dan bobot Learning Unit mencapai 100%.

### Tahap 7 — Uji coba satu putaran

*Kaprodi memimpin, dengan satu dosen atau preseptor dan satu mahasiswa.*

Jangan langsung membuka untuk semua orang. Jalankan satu putaran penuh dengan kegiatan nyata, karena kasus dan kegiatan yang sudah diverifikasi tidak dapat dihapus, dan akun yang sudah punya rekam jejak hanya dapat dinonaktifkan.

<svg class="dg" viewBox="0 0 760 330" role="img" aria-label="Alur kerja harian antara mahasiswa, dosen atau preseptor, admin, dan kaprodi">
  <defs><marker id="ar-rutin" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <rect x="10" y="10" width="740" height="72" rx="8" class="dg-frame"/><text x="22" y="50" class="dg-t dg-b">Mahasiswa</text>
  <rect x="10" y="90" width="740" height="72" rx="8" class="dg-frame"/><text x="22" y="124" class="dg-t dg-b">Dosen /</text><text x="22" y="139" class="dg-t dg-b">Preseptor</text>
  <rect x="10" y="170" width="740" height="72" rx="8" class="dg-frame"/><text x="22" y="210" class="dg-t dg-b">Admin</text>
  <rect x="10" y="250" width="740" height="72" rx="8" class="dg-frame"/><text x="22" y="290" class="dg-t dg-b">Kaprodi</text>
  <rect x="105" y="22" width="130" height="48" rx="8" class="dg-box"/><text x="170" y="42" class="dg-t" text-anchor="middle">Catat kegiatan</text><text x="170" y="58" class="dg-t" text-anchor="middle">dan kasus</text>
  <rect x="270" y="22" width="130" height="48" rx="8" class="dg-box"/><text x="335" y="42" class="dg-t" text-anchor="middle">Kirim untuk</text><text x="335" y="58" class="dg-t" text-anchor="middle">verifikasi</text>
  <rect x="590" y="22" width="150" height="48" rx="8" class="dg-box-green"/><text x="665" y="42" class="dg-t" text-anchor="middle">Terima notifikasi,</text><text x="665" y="58" class="dg-t" text-anchor="middle">lihat nilai dan target</text>
  <rect x="270" y="102" width="130" height="48" rx="8" class="dg-box-amber"/><text x="335" y="122" class="dg-t" text-anchor="middle">Verifikasi atau</text><text x="335" y="138" class="dg-t" text-anchor="middle">minta revisi</text>
  <rect x="430" y="102" width="130" height="48" rx="8" class="dg-box-amber"/><text x="495" y="122" class="dg-t" text-anchor="middle">Nilai DOPS</text><text x="495" y="138" class="dg-t" text-anchor="middle">dan Mini-CEX</text>
  <rect x="430" y="182" width="130" height="48" rx="8" class="dg-box-gray"/><text x="495" y="202" class="dg-t" text-anchor="middle">Impor nilai</text><text x="495" y="218" class="dg-t" text-anchor="middle">ujian</text>
  <rect x="590" y="262" width="150" height="48" rx="8" class="dg-box"/><text x="665" y="282" class="dg-t" text-anchor="middle">Pantau Analitik</text><text x="665" y="298" class="dg-t" text-anchor="middle">dan Monitoring SRQ</text>
  <rect x="400" y="262" width="160" height="48" rx="8" class="dg-box-green"/><text x="480" y="282" class="dg-t" text-anchor="middle">Tindak lanjuti mahasiswa,</text><text x="480" y="298" class="dg-t" text-anchor="middle">ekspor laporan</text>
  <line x1="235" y1="46" x2="268" y2="46" class="dg-arrow" marker-end="url(#ar-rutin)"/>
  <line x1="335" y1="70" x2="335" y2="100" class="dg-arrow" marker-end="url(#ar-rutin)"/>
  <line x1="400" y1="126" x2="428" y2="126" class="dg-arrow" marker-end="url(#ar-rutin)"/>
  <path d="M560,126 L625,126 L625,72" class="dg-arrow" marker-end="url(#ar-rutin)"/>
  <path d="M560,206 L625,206 L625,126" class="dg-arrow"/>
  <line x1="700" y1="70" x2="700" y2="260" class="dg-arrow dg-dash" marker-end="url(#ar-rutin)"/>
  <text x="706" y="170" class="dg-lbl">data</text>
  <line x1="590" y1="286" x2="562" y2="286" class="dg-arrow" marker-end="url(#ar-rutin)"/>
</svg>

| Urutan | Siapa | Lakukan | Yang harus terlihat |
|---|---|---|---|
| 1 | Dosen dan mahasiswa | Masuk dengan kata sandi sementara dan buat kata sandi baru | Diarahkan ke **Pengaturan Akun** sebelum dapat membuka halaman lain |
| 2 | Mahasiswa | Lengkapi profil, lalu periksa **Beranda** | Rotasi atau blok tampil, profil 100% |
| 3 | Mahasiswa | **Logbook Kegiatan → + Catat Kegiatan** | Kegiatan berstatus belum diverifikasi |
| 4 | Mahasiswa | **Kasus Klinis → + Kasus Baru**, tandai pembimbing, simpan, lalu **Kirim untuk Verifikasi** | Status *Menunggu Verifikasi*, identitas pasien tersamar |
| 5 | Dosen | **Validasi Kasus Klinis**, pilih tingkat entrustment, lalu **Setujui / Verifikasi** | Kasus keluar dari antrean, identitas pasien terbuka bagi pembimbing |
| 6 | Dosen | **Validasi Kegiatan**, verifikasi kegiatannya | Lencana antrean berkurang |
| 7 | Dosen | **Workplace Assessment → + DOPS**, isi rubriknya, lalu **Kirim Evaluasi** | Evaluasi berstatus Terkirim |
| 8 | Mahasiswa | Buka **Notifikasi** dan **Kasus Klinis** | Ada notifikasi verifikasi dan DOPS, target kasus bertambah |
| 9 | Kaprodi | Buka **Dashboard Analitik** | Rata-rata DOPS dan kasus terverifikasi mahasiswa itu tampil |

![Langkah pertama wizard kasus: data pasien, identitas tersamar, keluhan utama, dan pilihan pembimbing](panduan/mulai-16-kasus-langkah1.png)

![Antrean Perlu Diverifikasi milik dosen berisi satu kasus](panduan/mulai-17-antrean-verifikasi.png)

![Halaman verifikasi: identitas pasien terbuka bagi pembimbing, tingkat entrustment, serta tombol Setujui, Minta Revisi, dan Tolak](panduan/mulai-18-form-verifikasi.png)

![Halaman Kasus Klinis mahasiswa: target FKRTL 1 dari 30 dan satu kasus terverifikasi](panduan/mulai-19-kasus-target.png)

![Dashboard Analitik kaprodi: ringkasan prodi, radar kohort, dan tabel mahasiswa](panduan/mulai-20-analitik-kaprodi.png)

**Selesai bila:** kesembilan langkah berjalan, dan pembimbing serta mahasiswa uji coba tidak lagi perlu dibantu. Catat apa yang membingungkan mereka untuk bahan sosialisasi.

### Tahap 8 — Luncurkan ke dosen dan mahasiswa

*Kaprodi memimpin, admin menyiapkan kata sandi.*

Luncurkan ke **dosen dan preseptor lebih dulu**, supaya antrean verifikasi sudah ada yang menjaga saat mahasiswa mulai mencatat. Sampaikan kata sandi sementara satu per satu, jangan di grup.

Pesan untuk dosen dan preseptor:

> Yth. Bapak/Ibu, logbook prodi kini memakai JEJAK di **[alamat aplikasi]**. Masuk dengan email **[email]** dan kata sandi sementara **[kata sandi]**, lalu buat kata sandi baru. Tugas Bapak/Ibu: (1) lengkapi profil, (2) periksa **Validasi Kasus Klinis** dan **Validasi Kegiatan** minimal [frekuensi], (3) isi DOPS dan Mini-CEX lewat **Workplace Assessment**. Panduan: menu **Panduan Penggunaan**, Bab 5. Bantuan: **[kontak]**.

Pesan untuk mahasiswa:

> Mulai **[tanggal]**, logbook dicatat di JEJAK: **[alamat aplikasi]**. Masuk dengan email **[email]** dan kata sandi sementara **[kata sandi]**, lalu buat kata sandi baru. Lakukan hari ini: (1) lengkapi profil, (2) periksa rotasi atau blok Anda di Beranda, (3) catat kegiatan dan kasus maksimal [batas waktu] setelah kejadian. Jangan menulis nama atau nomor identitas pasien di kolom bebas; hanya kolom Identitas Pasien yang terlindungi. Panduan: menu **Panduan Penggunaan**, Bab 4. Bantuan: **[kontak]**.

**Aktifkan SRQ-20 saat prodi siap.** Menu **Kesehatan Mental (SRQ)** tidak tampil bagi mahasiswa sampai kaprodi mengaktifkannya untuk prodinya. Tanda "Perlu Perhatian Segera" hanya muncul di halaman kaprodi, jadi pastikan dulu ada yang menindaklanjutinya. Buka **Coaching Center → Monitoring SRQ**, centang ketiga pernyataan kesiapan, lalu klik **Aktifkan SRQ-20**. Bila perlu berhenti, klik **Nonaktifkan**: mahasiswa tidak dapat mengisi lagi, tetapi riwayatnya tetap tersimpan.

![Monitoring SRQ sebelum aktif: tiga pernyataan kesiapan dan tombol Aktifkan SRQ-20](panduan/mulai-22-srq-aktivasi.png)

**Selesai bila:** semua dosen dan mahasiswa sudah pernah masuk. Periksa kolom *Login Terakhir* pada dataset Data Mahasiswa di **Ekspor Data**. Untuk dosen, admin memakai dataset Pengguna & Peran.

### Tahap 9 — Kerja rutin setelah berjalan

| Kapan | Kaprodi | Admin |
|---|---|---|
| Setiap minggu | Periksa **Mahasiswa Perlu Perhatian** di Beranda, **Dashboard Analitik**, dan **Monitoring SRQ**, lalu catat tindak lanjutnya | Reset kata sandi dan buka akun terkunci bila diminta |
| Setiap selesai ujian | Periksa nilai unit di **Learning Unit & Matrix** | Impor nilai ke event terkait |
| Setiap bulan | **Ekspor Data** untuk rapat evaluasi prodi | Nonaktifkan atau hapus akun yang tak dikenal, lalu periksa **Riwayat Ekspor** dan audit **Data Governance** |
| Setiap semester | Tetapkan target kasus dan bobot baru | Buat periode, event, dan target baru; impor akun, rotasi, dan enrolment; pindah prodi lewat **Relabel Prodi** |
| Saat aplikasi dimutakhirkan | Coba satu alur singkat sesudahnya | Minta IT mencadangkan data sebelum `docker compose pull` |

Kaprodi memantau satu mahasiswa lewat **Daftar Mahasiswa**: cari nama, lalu buka Dasbor Mahasiswa (hanya-baca). Dari sana tersedia Evaluasi Akademik, Peta Kompetensi, dan Peta EPA mahasiswa itu.

![Beranda kaprodi: panel Langkah Penyiapan untuk prodinya, ringkasan hari ini, dan menu Monitoring SRQ serta Ekspor Data di sidebar](panduan/mulai-21-beranda-kaprodi.png)

![Monitoring SRQ setelah aktif: status, jumlah yang sudah mengisi, kategori hasil, dan rekap per angkatan](panduan/mulai-23-monitoring-srq.png)

![Ekspor Data versi kaprodi: prodi terkunci, filter periode dan tanggal, serta kartu dataset](panduan/mulai-24-ekspor-kaprodi.png)

### Bila ada kendala

| Gejala | Penyebab | Yang dilakukan |
|---|---|---|
| Kaprodi melihat *Akun kaprodi Anda belum terhubung ke Program Studi* | Prodi pada akun lama kosong | Admin: **Pengguna → Sunting → Program Studi** |
| Pengguna melihat *Akun Anda dinonaktifkan* | Admin menonaktifkan akunnya | Admin: **Pengguna → Sunting → Aktifkan Kembali** |
| Tautan *Daftar* tidak tampil | Pendaftaran mandiri tertutup | Akun dibuat lewat impor, atau admin: **Pengguna → Buka Pendaftaran** |
| Mahasiswa tidak melihat menu **Kesehatan Mental (SRQ)** | Kaprodi belum mengaktifkannya | Kaprodi: **Monitoring SRQ → Aktifkan SRQ-20** |
| Menu **Rotasi Klinik** atau **Kasus Klinis** kaprodi kosong | Wajar: menu itu hanya memuat data akunnya sendiri | Pantau lewat **Dashboard Analitik**, **Daftar Mahasiswa**, atau **Ekspor Data** |
| Menu **Konfigurasi** tidak tampil | Akun tidak berperan Admin | Admin lain menambahkan perannya lewat **Pengguna → Sunting** |
| Lupa kata sandi, atau akun terkunci setelah 10 kali salah | Tanpa email, tautan *Lupa kata sandi* tidak tersedia | Admin: **Pengguna → Sunting → Reset Kata Sandi**. Akun terkunci juga terbuka sendiri setelah 15 menit |
| Kata sandi sementara hasil impor hilang | Daftarnya hanya tampil sekali | Admin: **Reset Kata Sandi** per akun |
| Mahasiswa tidak melihat event rubrik | Status belum Terbit, prodi berbeda, atau nama blok tidak sama | Periksa event, profil mahasiswa, dan nama stase atau blok |
| Hasil impor melaporkan email tak dikenal | Email di berkas nilai berbeda dengan email akun | Samakan emailnya, lalu impor ulang |
| Kartu target kasus tidak tampil | Belum ada target untuk prodi itu | Admin: **Target Kasus Logbook → + Tambah Target** |
| Pembimbing tidak melihat mahasiswanya | Belum ada penempatan yang menunjuknya | Admin: isi preseptor pada rotasi atau tutor pada enrolment |
| Peta EPA menampilkan kerangka yang keliru | Prodi belum memilih, atau memilih kerangka lain | Admin: **Program Studi → Sunting → Kerangka Peta EPA** |

---

## Bab 1 — Memulai

### 1.1 Mendaftar akun

1. Buka halaman muka aplikasi, lalu klik **Daftar**.
2. Isi **Nama Lengkap**, **Email**, lalu buat **Kata Sandi** (minimal 8 karakter) dan ulangi.
3. Klik **Daftar**. Akun baru selalu berperan **Mahasiswa**.

![Formulir Daftar Akun: nama lengkap, email, kata sandi, dan catatan bahwa akun baru berperan Mahasiswa](panduan/1-1-daftar.png)

Peran **Dosen**, **Preseptor**, **Kaprodi**, dan **Admin** tidak dapat dipilih sendiri karena membuka kasus klinis dan data seluruh mahasiswa — admin instansi yang memberikannya lewat **Konfigurasi → Pengguna → Sunting** (atau kolom `peran` pada impor CSV). Permintaan peran lain lewat form yang diubah pun ditolak dan akun tetap menjadi Mahasiswa.

Bila instansi Anda mengaktifkan login Google, tombol **Masuk dengan Google** juga tersedia — akun Google baru otomatis dibuat sebagai pengguna dan dianggap sudah terverifikasi.

> **Konfirmasi email.** Konfirmasi lewat surel hanya diminta bila server dipasangi layanan pengirim email. Pada instalasi tanpa server surat, akun hasil pendaftaran langsung bisa dipakai. Jika Anda mendapat pesan "harus mengonfirmasi email" padahal tidak pernah menerima suratnya, minta admin membuka **Konfigurasi → Pengguna → Sunting → Konfirmasi Sekarang**.

Instalasi baru menutup pendaftaran mandiri secara bawaan: tautan **Daftar** tidak tampil, dan admin membuat akun lewat **impor CSV** (lihat [Pengguna & impor CSV](#pengguna--impor-csv)). Akun hasil impor menerima **kata sandi sementara** acak dari admin. Saat pertama masuk, Anda diarahkan ke **Pengaturan Akun** dan wajib membuat kata sandi baru sebelum bisa membuka halaman lain.

### 1.2 Masuk, lupa kata sandi, keluar

- **Masuk**: email + kata sandi, atau tombol Google. Centang **Ingat saya** agar tidak perlu masuk ulang di perangkat yang sama.
- **Lupa kata sandi**: tautan *Lupa kata sandi?* di halaman masuk mengirim tautan reset ke email Anda (hanya tampil bila server bisa mengirim email). Tanpa server surat, minta admin me-reset kata sandi Anda dari **Konfigurasi → Pengguna**; Anda menerima kata sandi sementara baru yang wajib diganti saat masuk.
- **Akun terkunci**: setelah 10 kali salah kata sandi, akun terkunci 15 menit lalu terbuka sendiri; admin juga bisa membukanya lewat **Reset Kata Sandi**. Percobaan masuk yang terlalu cepat dari satu perangkat dibatasi sementara (pesan "Terlalu banyak percobaan").
- **Sesi**: tanpa centang **Ingat saya**, sesi berakhir setelah 2 jam tidak aktif. Kata sandi `password123` tidak dapat dipakai karena tercantum publik.
- **Ganti kata sandi / email**: menu akun (pojok kanan atas) → **Pengaturan Saya** → tautan **Pengaturan Akun**, atau langsung ke `/users/edit`. Ubah **Email** dan/atau isi **Kata Sandi Baru** + **Ulangi Kata Sandi Baru** (kosongkan bila tidak ingin mengganti), lalu isi **Kata Sandi Saat Ini** — wajib untuk menyimpan perubahan apa pun di halaman itu. Pada instalasi yang mengirim email, email baru berlaku setelah tautan konfirmasi yang dikirim ke alamat baru dibuka.
- **Keluar**: menu akun → **Keluar**.

![Halaman Masuk dengan isian email, kata sandi, dan centang Ingat saya](panduan/1-2-masuk.png)

### 1.3 Melengkapi profil

Buka **Ikhtisar → Profil Saya** (`/profile`) lalu **Sunting Profil**. Halaman profil menampilkan **persentase kelengkapan** dan daftar isian yang belum diisi — daftar itu berbeda per peran:

| Bagian | Isian | Wajib untuk |
|---|---|---|
| Foto & Akun | Foto profil, Nama Lengkap, Email (hanya dibaca), NPM/NIM atau NIP/NIDN | semua |
| Biodata Pribadi | Nomor Telepon / WhatsApp, Jenis Kelamin, Tempat & Tanggal Lahir, Alamat Domisili | semua (telepon, jenis kelamin, tanggal lahir) |
| Akademik | Program Studi, Angkatan | mahasiswa |
| Informasi Kepegawaian | Unit Kerja / Departemen, Jabatan, Kategori Profesi, Spesialisasi, Program Studi Binaan | dosen / preseptor / kaprodi / admin |

![Halaman Profil Saya: persentase kelengkapan profil, biodata pribadi, dan data akademik](panduan/1-3-profil.png)

**Program Studi sangat penting bagi mahasiswa**: ia menentukan event asesmen mana yang tampil untuk Anda, target kasus logbook, Learning Unit, kurva persentil kohort, dan tampilan Anda di Dashboard Analitik kaprodi. Program studi tersedia dua: **Sarjana Kedokteran (pssk)** dan **Profesi Dokter (pspd)** — admin dapat menambah lainnya.

Bagi **kaprodi**, isian **Program Studi Binaan** hanya ditampilkan dan tidak dapat diubah sendiri, karena prodi itulah batas hak akses kaprodi (mahasiswa yang dapat dibuka, Dashboard Analitik bagian *Program Studi*, Relabel Prodi, Jadwal DOPS & Mini-CEX, Learning Unit, dan Ekspor Data). Admin menetapkannya lewat **Konfigurasi → Pengguna → Sunting**.

---

## Bab 2 — Mengenal Antarmuka

### 2.1 Anatomi layar

<svg class="dg" viewBox="0 0 760 400" role="img" aria-label="Anatomi layar: sidebar kiri, topbar, area konten, bilah bawah ponsel">
  <rect x="10" y="10" width="740" height="330" rx="10" class="dg-frame"/>
  <rect x="10" y="10" width="190" height="330" rx="10" class="dg-dark"/>
  <text x="105" y="38" class="dg-tw dg-b" text-anchor="middle">JEJAK</text>
  <text x="105" y="52" class="dg-tw dg-s" text-anchor="middle">Nama prodi Anda</text>
  <line x1="20" y1="62" x2="190" y2="62" class="dg-line-w"/>
  <circle cx="36" cy="82" r="10" class="dg-accent"/>
  <text x="52" y="80" class="dg-tw dg-s">Nama Anda</text>
  <text x="52" y="92" class="dg-tw dg-s">Peran aktif</text>
  <rect x="20" y="102" width="170" height="16" rx="4" class="dg-dark2"/>
  <text x="105" y="114" class="dg-tw dg-s" text-anchor="middle">Edit Profil</text>
  <rect x="20" y="126" width="170" height="16" rx="4" class="dg-dark2"/>
  <text x="28" y="138" class="dg-tw dg-s">Cari menu…</text>
  <text x="24" y="162" class="dg-tw dg-s dg-b">IKHTISAR</text>
  <text x="30" y="176" class="dg-tw dg-s">Beranda · Portfolio · Profil · Notifikasi</text>
  <text x="24" y="196" class="dg-tw dg-s dg-b">PERJALANAN BELAJAR</text>
  <text x="30" y="210" class="dg-tw dg-s" textLength="158" lengthAdjust="spacingAndGlyphs">Logbook ▾ · Rotasi · Tutorial · Refleksi · TA</text>
  <text x="24" y="230" class="dg-tw dg-s dg-b">ASESMEN</text>
  <text x="30" y="244" class="dg-tw dg-s">Asesmen &amp; Evaluasi ▾</text>
  <text x="24" y="264" class="dg-tw dg-s dg-b">KOMPETENSI &amp; PRESTASI</text>
  <text x="24" y="284" class="dg-tw dg-s dg-b">COACHING CENTER · KONFIGURASI</text>
  <line x1="20" y1="300" x2="190" y2="300" class="dg-line-w"/>
  <text x="30" y="318" class="dg-tw dg-s">Panduan · Pengaturan · Keluar</text>
  <rect x="200" y="10" width="550" height="44" class="dg-topbar"/>
  <text x="212" y="36" class="dg-t dg-b">☰  Judul halaman</text>
  <rect x="380" y="20" width="90" height="24" rx="6" class="dg-box-gray"/>
  <text x="425" y="36" class="dg-ts" text-anchor="middle">Peran aktif ▾</text>
  <rect x="478" y="20" width="70" height="24" rx="6" class="dg-box-gray"/>
  <text x="513" y="36" class="dg-ts" text-anchor="middle">Cari…</text>
  <text x="565" y="36" class="dg-ts">☼</text>
  <text x="588" y="36" class="dg-ts">EN</text>
  <text x="616" y="36" class="dg-ts">?</text>
  <text x="640" y="36" class="dg-ts">🔔</text>
  <circle cx="700" cy="32" r="11" class="dg-accent"/>
  <text x="700" y="36" class="dg-tw dg-s" text-anchor="middle">A</text>
  <rect x="215" y="70" width="520" height="255" rx="8" class="dg-box"/>
  <text x="475" y="180" class="dg-t" text-anchor="middle">Area konten halaman</text>
  <text x="475" y="198" class="dg-ts" text-anchor="middle">(kartu, tabel, formulir, grafik)</text>
  <rect x="10" y="352" width="740" height="38" rx="8" class="dg-box-gray"/>
  <text x="80" y="375" class="dg-ts" text-anchor="middle">Beranda</text>
  <text x="230" y="375" class="dg-ts" text-anchor="middle">Log Keg.</text>
  <text x="380" y="375" class="dg-ts" text-anchor="middle">Log Kasus</text>
  <text x="530" y="375" class="dg-ts" text-anchor="middle">Verifikasi / Asesmen</text>
  <text x="680" y="375" class="dg-ts" text-anchor="middle">Profil</text>
  <text x="745" y="349" class="dg-lbl" text-anchor="end">↓ Bilah bawah (hanya di ponsel)</text>
</svg>

| Bagian | Isi |
|---|---|
| **Sidebar** (kiri, gelap) | Merek + nama prodi, identitas & **peran aktif**, tombol **Edit Profil**, kotak **Cari menu** (menyaring menu saat mengetik), grup menu, dan di kaki: **Panduan Penggunaan**, **Pengaturan**, **Keluar**. Di ponsel sidebar tersembunyi; buka dengan tombol ☰. |
| **Topbar** (atas, putih) | Judul halaman, pengalih **Peran aktif**, kotak **Cari** (menuju halaman Pencarian; khusus dosen/preseptor/kaprodi/admin), tombol **tema** (terang → gelap → ikuti sistem), tombol bahasa **EN/ID**, tombol **?** (membuka panduan ini di tab baru), **lonceng notifikasi** (5 terbaru + lencana belum dibaca), dan **menu akun** (Profil Saya, Pengaturan Saya, Keluar). |
| **Area konten** | Halaman yang sedang dibuka. |
| **Bilah bawah** (ponsel) | Lima pintasan: Beranda, Log Kegiatan, Log Kasus, Verifikasi (dosen / preseptor / admin) atau Asesmen (mahasiswa dan kaprodi), Profil. |

![Tampilan di ponsel: tombol menu ☰ di topbar dan bilah bawah berisi lima pintasan](panduan/2-1-tampilan-ponsel.png){: .pd-phone}

### 2.2 Grup menu sidebar

Sidebar hanya memuat enam grup, dan **menyempit mengikuti peran aktif** — bukan gabungan semua peran yang Anda miliki.

| Grup | Menu | Tampil untuk |
|---|---|---|
| **Ikhtisar** | Beranda, Longitudinal Portfolio (mahasiswa), Profil Saya, Notifikasi | semua |
| **Perjalanan Belajar** | Logbook ▾ (Kasus Klinis, Logbook Kegiatan), Rotasi Klinik, Enrolment Tutorial, Refleksi, Tugas Akhir, Kesehatan Mental (SRQ)* | semua (*hanya mahasiswa) |
| **Asesmen** | Asesmen & Evaluasi ▾ (Evaluasi Akademik, Workplace Assessment, Rubric-based Assessment, Jurnal Umpan Balik*, Assessment Form Builder†) | semua (*Jurnal hanya mahasiswa; †Form Builder hanya kaprodi & admin) |
| **Kompetensi & Prestasi** | Peta Kompetensi, Peta EPA & Entrustment | semua |
| **Coaching Center** | Validasi Kasus Klinis & Validasi Kegiatan (hanya akun yang boleh memverifikasi — dosen / preseptor / admin), Dashboard Analitik, Daftar Mahasiswa, serta Relabel Prodi Mahasiswa, Jadwal DOPS & Mini-CEX, Learning Unit & Matrix, Monitoring SRQ, dan Ekspor Data (CSV) (kaprodi) | peran aktif dosen / preseptor / kaprodi / admin |
| **Konfigurasi** | 19 menu pengelolaan (lihat [Bab 6](#bab-6--panduan-admin-konfigurasi)) | akun yang **memiliki** peran admin, apa pun peran aktifnya |

Lencana angka di **Validasi Kasus Klinis** dan **Validasi Kegiatan** menunjukkan jumlah butir yang menunggu verifikasi oleh Anda — kasus/kegiatan milik akun Anda sendiri tidak dihitung.

![Sidebar akun admin, ditampilkan dua kolom: grup Ikhtisar sampai Coaching Center, lalu grup Konfigurasi (sampai Ekspor Data) dan kaki sidebar](panduan/2-2-sidebar-admin.png)

### 2.3 Ganti peran

Satu akun dapat menyandang beberapa peran (mis. dosen yang juga preseptor, atau mahasiswa yang juga admin). Pilih peran pada dropdown **Peran aktif** di topbar; sidebar, beranda, dan bilah bawah ikut menyesuaikan. Peran aktif hanya mengubah **apa yang ditawarkan** — hak akses tiap halaman tetap diperiksa dari seluruh peran yang Anda miliki, sehingga:

- akun multi-peran **tidak bisa memverifikasi kasus atau kegiatannya sendiri**;
- grup **Konfigurasi** tampil selama akun memiliki peran admin, walau peran aktifnya mahasiswa.

![Topbar akun multi-peran dengan dropdown Peran Aktif](panduan/2-3-ganti-peran.png)

### 2.4 Tema, ukuran huruf, dan bahasa

Buka **Pengaturan Saya** (`/pengaturan`) dari kaki sidebar atau menu akun:

- **Mode warna**: Terang, Gelap, atau Ikuti sistem. Tombol ☼ di topbar juga menggilirnya.
- **Ukuran huruf**: Kecil, Normal, Besar — seluruh antarmuka ikut berubah proporsional.
- **Bahasa antarmuka**: Bahasa Indonesia atau English. Tombol **EN/ID** di topbar mengganti bahasa secara langsung. Cakupannya **hanya cangkang** (sidebar, topbar, bilah bawah, halaman masuk/daftar, Pengaturan Saya); isi halaman tetap berbahasa Indonesia.

Preferensi disimpan pada akun, jadi berlaku di semua perangkat.

![Halaman Pengaturan Saya: mode warna, ukuran huruf, dan bahasa antarmuka](panduan/2-4-pengaturan.png)

### 2.5 Pencarian

Kotak **Cari** di topbar dan menu **Daftar Mahasiswa** (`/cari`) mencari **pengguna** berdasarkan nama atau email — hanya untuk dosen, preseptor, kaprodi, dan admin. Pengajar hanya menemukan **mahasiswa**, kaprodi hanya mahasiswa **prodi binaannya**, dan admin menemukan semua pengguna. Kartu mahasiswa membuka **Dasbor Mahasiswa**; kartu pengguna lain membuka halaman sunting akun (admin). Pencarian belum mencakup isi logbook atau kasus.

![Halaman Pencarian dengan hasil kartu mahasiswa dan tautan Dasbor Mahasiswa](panduan/2-5-pencarian.png)

**Memilih nama di formulir.** Setiap kolom pilihan nama mahasiswa atau pengajar dapat **diketik untuk mencari** — antara lain mahasiswa & preseptor di Rotasi Klinik, mahasiswa & tutor di Enrolment Tutorial, mahasiswa & rotasi di DOPS/Mini-CEX, dosen pembimbing Tugas Akhir, pembimbing kasus klinis, subjek formulir evaluasi, serta peserta & penguji di Assessment Events dan Jadwal DOPS & Mini-CEX.

- Klik kolomnya lalu ketik sebagian nama; daftar langsung tersaring. Huruf besar/kecil dan urutan kata tidak berpengaruh — `sari dew` menemukan "Dewi Sari". Kolom rotasi juga bisa dicari dengan nama stase.
- Pilih dengan klik, atau dengan tombol **↑/↓** lalu **Enter**. **Esc** menutup daftar tanpa mengubah pilihan.
- Pada kolom opsional, hapus teksnya atau pilih **— Kosongkan pilihan —** untuk mengosongkan. Teks yang tidak cocok dengan nama mana pun dikembalikan ke pilihan sebelumnya.

![Kolom Mahasiswa pada formulir Tambah Rotasi: mengetik "mahas" langsung menyaring daftar nama](panduan/2-5-pilih-nama.png)

### 2.6 Notifikasi

Halaman **Ikhtisar → Notifikasi** (`/notifications`) memuat semua pemberitahuan: kasus diverifikasi/perlu revisi/ditolak, kegiatan diverifikasi, DOPS/Mini-CEX baru, nilai keluar, permintaan penilaian, komentar kasus, tingkat entrustment diperbarui, skor ujian tugas akhir, dan jadwal. Tiap butir bisa **ditandai dibaca** atau **diarsipkan**; tombol **Tandai semua dibaca** membersihkan lencana sekaligus.

![Halaman Notifikasi dengan tombol Aktifkan Notifikasi Push, Tandai dibaca, dan Arsipkan](panduan/2-6-notifikasi.png)

**Notifikasi push** (opsional, bila server dipasangi kunci VAPID): klik **Aktifkan Notifikasi Push** dan izinkan di peramban. Di iPhone, fitur ini hanya bekerja setelah aplikasi ditambahkan ke Layar Utama. Lihat juga [Bab 8](#bab-8--notifikasi).

---

## Bab 3 — Peran dan Hak Akses

| Peran | Fungsi utama | Yang boleh dilakukan |
|---|---|---|
| **Mahasiswa** | Mencatat perjalanan belajar | Mencatat kegiatan & kasus, mengajukan verifikasi, meminta DOPS/Mini-CEX/CBD/Long Case dari kasus, mendaftar & mengumpulkan asesmen rubrik, menulis refleksi, mendaftarkan tugas akhir, melihat nilai, capaian, dan peta EPA miliknya sendiri. |
| **Dosen** | Pembimbing akademik, tutor, penguji | Memverifikasi kasus (yang menandainya atau tanpa tanda pembimbing) & kegiatan mahasiswa mana pun, menilai DOPS/Mini-CEX, menilai di Lembar Penguji, memberi skor tugas akhir, memutuskan tingkat EPA bagi mahasiswa yang berelasi, Dashboard Analitik bagian *Mahasiswa Bimbingan*. |
| **Preseptor** | Pembimbing klinis di wahana | Setara dosen untuk verifikasi & penilaian; menjadi penilai bawaan DOPS/Mini-CEX yang diminta dari kasus pada rotasinya; Dashboard Analitik bagian *Mahasiswa di Wahana Anda*. |
| **Kaprodi** | Pemantau program studi | Membuka halaman mahasiswa **prodi binaannya** (hanya melihat — tidak memverifikasi kasus/kegiatan, tidak menilai DOPS/Mini-CEX, tidak memutuskan EPA), Dashboard Analitik bagian *Program Studi*, Relabel Prodi Mahasiswa, Jadwal DOPS & Mini-CEX, Learning Unit & Matrix, **Ekspor Data (CSV)** — semuanya terkunci ke prodi binaan yang ditetapkan admin — serta **Assessment Form Builder** (kelola penuh) dan Lembar Penguji untuk mahasiswa prodi binaannya atau bila ditunjuk sebagai penguji. |
| **Admin** | Pengelola instalasi | Semua hal di atas ditambah seluruh grup **Konfigurasi**: pengguna, periode, prodi, event asesmen, kurikulum, master data, taksonomi, istilah, dan tata kelola data. |

Aturan yang berlaku lintas peran:

- **Kepemilikan**: mahasiswa hanya melihat data miliknya; pembimbing dapat membuka kasus/kegiatan siapa pun (untuk verifikasi) — kecuali **draf kasus**, yang hanya terlihat pemiliknya dan admin — dan DOPS/Mini-CEX/tugas akhir yang berkaitan dengannya; admin melihat semuanya.
- **Anti-konflik**: verifikasi kasus/kegiatan tidak bisa dilakukan atas data milik sendiri, kasus yang menandai pembimbing hanya bisa diverifikasi pembimbing itu, dan hanya verifier asal atau admin yang boleh **membatalkan** verifikasi. Akun multi-peran juga tidak dapat menilai **dirinya sendiri** — DOPS/Mini-CEX, percobaan asesmen di Lembar Penguji, maupun skor tugas akhir.
- **Prodi binaan kaprodi**: kaprodi yang bukan admin hanya membuka dan mengelola data mahasiswa prodi yang ditetapkan admin pada akunnya; tanpa prodi binaan, halaman pengelolaannya menolak dengan pesan *akun kaprodi belum terhubung ke Program Studi*.
- **Relasi pembimbingan** (dipakai Peta EPA & Dashboard Analitik): seseorang dianggap membimbing mahasiswa bila pernah menilai DOPS/Mini-CEX-nya, membimbing tugas akhirnya, memverifikasi kasusnya, menjadi tutor enrolmennya, atau preseptor rotasinya.

---

## Bab 4 — Panduan Mahasiswa

### 4.1 Beranda mahasiswa

Beranda (`/dashboard`) mengikuti pola beranda jejak.pro, dari atas ke bawah:

- **Sapaan** dengan peran aktif, prodi, angkatan, dan jam WIB, lalu kartu **Sponsor Pengembangan** (AIPKI).
- **Agenda Mendatang** (7 hari ke depan; tampil bila ada isinya): rotasi klinik dan blok tutorial yang akan dimulai/berakhir, jadwal DOPS/Mini-CEX, ujian dan batas pengumpulan asesmen rubrik, tenggat milestone tugas akhir, serta kegiatan terjadwal di Kalender. Lima terdekat ditampilkan, sisanya diringkas "+N agenda lainnya".
- **Kasus diminta diperbaiki**: kasus yang dikembalikan preseptor (status *Perlu Revisi*), lengkap dengan nama peminta.
- **Kasus masih draft**: draft hanya terlihat oleh Anda; preseptor baru menerimanya setelah Anda menekan **Kirim untuk Verifikasi**.
- **Pengingat pencatatan kasus**: muncul bila Anda sedang berotasi dan **2 hari** tidak mencatat kasus baru.
- **Tahap studi** (Pre-Klinik/Sarjana → Klinik/Profesi, dari jenjang prodi Anda), kartu **fokus yang sedang berjalan** (rotasi atau blok aktif, preseptor/tutor, jumlah kegiatan bulan ini, kasus terverifikasi, refleksi, dan tombol Catat Kasus/Kegiatan/Tulis Refleksi), serta **Kelengkapan Profil**.
- **Perhatian Akademik**: muncul bila dalam 30 hari terakhir ada kasus yang diverifikasi dengan **rekomendasi remediasi**, atau rata-rata DOPS/Mini-CEX Anda **di bawah 4** (skala 1–9).
- **Pusat Asesmen & Capaian**: enam kartu pintasan — Evaluasi Akademik (dengan lencana jumlah asesmen menunggu), Workplace Assessment, Rubric-based Assessment, Jurnal Umpan Balik, Peta Kompetensi, Peta EPA.
- **Radar kompetensi** rata-rata dimensi DOPS & Mini-CEX Anda (bila sudah ada evaluasi terkirim), lalu kartu informasi peningkatan ke jejak.pro (bisa diciutkan).

![Beranda mahasiswa: sapaan, sponsor, Agenda Mendatang, tahap studi, rotasi berjalan, dan kelengkapan profil](panduan/4-1-beranda-mahasiswa.png)

Notifikasi yang belum dibaca ada di ikon lonceng topbar.

### 4.2 Logbook Kegiatan

Menu **Logbook → Logbook Kegiatan** (`/activity_logs`) mencatat kegiatan **bukan-kasus**: kuliah, tutorial, jaga, praktikum, seminar, kompetisi, pengabdian, dan sebagainya.

![Daftar Logbook Kegiatan dengan chip filter domain dan kompetensi serta linimasa per tanggal](panduan/4-2-logbook-kegiatan.png)

#### Taksonomi kegiatan

Setiap kegiatan digolongkan tiga tingkat, mengikuti daftar yang dikelola admin:

<svg class="dg" viewBox="0 0 760 210" role="img" aria-label="Taksonomi kegiatan tiga tingkat: Domain, Subdomain, Bentuk Kegiatan">
  <defs><marker id="ar-tax" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <text x="110" y="24" class="dg-lbl dg-b" text-anchor="middle">1. Domain Kegiatan</text>
  <text x="380" y="24" class="dg-lbl dg-b" text-anchor="middle">2. Subdomain / Kategori</text>
  <text x="650" y="24" class="dg-lbl dg-b" text-anchor="middle">3. Bentuk Kegiatan (opsional)</text>
  <rect x="20" y="40" width="180" height="44" rx="8" class="dg-box"/>
  <text x="110" y="60" class="dg-t dg-b" text-anchor="middle">Belajar Mengajar</text>
  <text x="110" y="76" class="dg-ts" text-anchor="middle">non-klinis</text>
  <rect x="290" y="40" width="180" height="44" rx="8" class="dg-box"/>
  <text x="380" y="66" class="dg-t" text-anchor="middle">Tutorial</text>
  <line x1="200" y1="62" x2="288" y2="62" class="dg-arrow" marker-end="url(#ar-tax)"/>
  <rect x="20" y="110" width="180" height="44" rx="8" class="dg-box-green"/>
  <text x="110" y="130" class="dg-t dg-b" text-anchor="middle">Prestasi Kemahasiswaan</text>
  <text x="110" y="146" class="dg-ts" text-anchor="middle">non-klinis</text>
  <rect x="290" y="110" width="180" height="44" rx="8" class="dg-box-green"/>
  <text x="380" y="136" class="dg-t" text-anchor="middle">Kompetisi</text>
  <rect x="560" y="110" width="180" height="44" rx="8" class="dg-box-green"/>
  <text x="650" y="136" class="dg-t" text-anchor="middle">Juara-1 Perorangan</text>
  <line x1="200" y1="132" x2="288" y2="132" class="dg-arrow" marker-end="url(#ar-tax)"/>
  <line x1="470" y1="132" x2="558" y2="132" class="dg-arrow" marker-end="url(#ar-tax)"/>
  <rect x="20" y="170" width="180" height="30" rx="8" class="dg-box-amber"/>
  <text x="110" y="189" class="dg-t" text-anchor="middle">Praktek</text>
  <text x="215" y="189" class="dg-ts">domain bertanda "kegiatan klinis" → dihitung Klinis di Portfolio</text>
</svg>

Domain yang ditandai admin sebagai *kegiatan klinis* membuat kegiatan itu dihitung sebagai **Klinis** di Portfolio dan kode pasien; selainnya **Non-Klinis**.

#### Mencatat kegiatan

1. Klik **+ Catat Kegiatan**.
2. Pilih **Domain Kegiatan** (wajib). Pilihan **Subdomain / Kategori** menyesuaikan domain, dan **Bentuk Kegiatan** muncul bila kategori itu punya rincian. Pilihan yang sudah dinonaktifkan admin tidak dapat dipilih baru.
3. Isi **Topik Kegiatan** (wajib), **Waktu Mulai** (wajib) dan Waktu Selesai, **Metode Pelaksanaan** Luring/Daring (wajib).
4. Lengkapi bila ada: Lokasi, **Rotasi Klinik/Wahana** (dari rotasi Anda sendiri), **Semester** (terisi otomatis bila tepat satu periode akademik mencakup tanggalnya), Catatan, Refleksi, Jumlah peserta, **Kompetensi** (centang ranah/sub-kompetensi dari Kerangka Kompetensi), serta **Dokumen & Bukti**: tautan bukti, tautan dokumen, dan unggahan berkas.
5. Klik simpan. Saat menyunting, unggahan baru **ditambahkan** ke lampiran lama, bukan menggantikannya.

![Formulir Catat Kegiatan Baru: domain, topik, lokasi, waktu, metode, rotasi, semester, dan kompetensi](panduan/4-2-catat-kegiatan.png)

#### Daftar, filter, dan Kalender

- Tab **Punya Saya** menampilkan kegiatan Anda dalam **linimasa per tanggal**. Chip filter **domain** dan **kompetensi** menyaring daftar; **✕ Hapus filter** mengembalikannya.
- Sakelar **Daftar \| Kalender** mengganti tampilan ke **kalender bulanan** (`/kalender`, navigasi ‹ › antar bulan). Kegiatan yang sudah diverifikasi diberi penanda warna berbeda.
- **Feed Kalender (iCal)** di bawah kalender: salin alamatnya ke Google Calendar/Outlook/Apple Calendar agar kegiatan Anda muncul di kalender pribadi. Alamat itu adalah kredensial — jika bocor, klik **Perbarui Tautan** dan tautan lama langsung tidak berlaku.
- Tombol **Buat Kode Pasien** pada halaman kegiatan klinis (hanya untuk pemilik kegiatan) membuat kode acak non-identifikasi (mis. `P-7K2M9QXA`) sebagai penanda pasien pada kegiatan itu tanpa menyimpan data pribadi. Kode dibuat per kegiatan dan belum dapat dipakai ulang pada kegiatan lain.
- Kegiatan Anda dapat dihapus dari halaman kegiatannya **selama belum diverifikasi**. Refleksi yang menautkan kegiatan itu tetap tersimpan; hanya tautannya yang dilepas.

![Kalender Kegiatan bulanan dengan penanda verifikasi dan kotak Feed Kalender (iCal)](panduan/4-2-kalender.png)

#### Verifikasi kegiatan

Kegiatan tersimpan dengan status *belum diverifikasi*. Pembimbing membukanya lewat **Validasi Kegiatan** dan menekan **Verifikasi**; Anda menerima notifikasi, kegiatan berpenanda ✓ di daftar dan kalender. Bila isi, waktu, bukti, atau kompetensi kegiatan terverifikasi diubah, statusnya kembali *belum diverifikasi* dan kegiatan masuk antrean lagi. Kolom refleksi boleh diubah tanpa verifikasi ulang. Kegiatan lama (dicatat sebelum taksonomi ada) tetap tampil sebagai Klinis/Non-Klinis; saat disunting Anda diminta memilih domain.

![Halaman kegiatan berstatus Terverifikasi: label hijau, nama preseptor yang memverifikasi, dan tanggal verifikasi](panduan/4-2-kegiatan-terverifikasi.png)

### 4.3 Logbook Kasus Klinis

Menu **Logbook → Kasus Klinis** (`/clinical_cases`). Halaman daftar memuat **statistik** (jumlah per status, 5 diagnosis terbanyak), kartu **Pemenuhan Target Kasus** FKTP/FKRTL (bila admin menetapkan target untuk prodi Anda; hanya kasus **terverifikasi** yang dihitung), dan daftar kasus Anda.

![Daftar Kasus Klinis dengan ringkasan status dan grafik diagnosis terbanyak](panduan/4-3-kasus-klinis.png)

#### Wizard 6 langkah

<svg class="dg" viewBox="0 0 760 150" role="img" aria-label="Wizard kasus klinis enam langkah">
  <defs><marker id="ar-wiz" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <g>
    <rect x="10" y="30" width="110" height="70" rx="8" class="dg-box"/>
    <circle cx="65" cy="20" r="11" class="dg-accent"/><text x="65" y="24" class="dg-tw dg-s dg-b" text-anchor="middle">1</text>
    <text x="65" y="58" class="dg-ts dg-b" text-anchor="middle">Identitas &amp;</text><text x="65" y="72" class="dg-ts dg-b" text-anchor="middle">Demografi</text>
    <text x="65" y="90" class="dg-ts" text-anchor="middle">tgl, keluhan*, pasien</text>
  </g>
  <line x1="120" y1="65" x2="136" y2="65" class="dg-arrow" marker-end="url(#ar-wiz)"/>
  <g>
    <rect x="138" y="30" width="110" height="70" rx="8" class="dg-box"/>
    <circle cx="193" cy="20" r="11" class="dg-accent"/><text x="193" y="24" class="dg-tw dg-s dg-b" text-anchor="middle">2</text>
    <text x="193" y="58" class="dg-ts dg-b" text-anchor="middle">Anamnesis, PF</text><text x="193" y="72" class="dg-ts dg-b" text-anchor="middle">&amp; Tanda Vital</text>
    <text x="193" y="90" class="dg-ts" text-anchor="middle">BMI otomatis</text>
  </g>
  <line x1="248" y1="65" x2="264" y2="65" class="dg-arrow" marker-end="url(#ar-wiz)"/>
  <g>
    <rect x="266" y="30" width="110" height="70" rx="8" class="dg-box"/>
    <circle cx="321" cy="20" r="11" class="dg-accent"/><text x="321" y="24" class="dg-tw dg-s dg-b" text-anchor="middle">3</text>
    <text x="321" y="58" class="dg-ts dg-b" text-anchor="middle">Pemeriksaan</text><text x="321" y="72" class="dg-ts dg-b" text-anchor="middle">Penunjang</text>
    <text x="321" y="90" class="dg-ts" text-anchor="middle">lab, radiologi, lain</text>
  </g>
  <line x1="376" y1="65" x2="392" y2="65" class="dg-arrow" marker-end="url(#ar-wiz)"/>
  <g>
    <rect x="394" y="30" width="110" height="70" rx="8" class="dg-box"/>
    <circle cx="449" cy="20" r="11" class="dg-accent"/><text x="449" y="24" class="dg-tw dg-s dg-b" text-anchor="middle">4</text>
    <text x="449" y="58" class="dg-ts dg-b" text-anchor="middle">Diagnosis &amp;</text><text x="449" y="72" class="dg-ts dg-b" text-anchor="middle">Tatalaksana</text>
    <text x="449" y="90" class="dg-ts" text-anchor="middle">ICD-10/SKDI otomatis</text>
  </g>
  <line x1="504" y1="65" x2="520" y2="65" class="dg-arrow" marker-end="url(#ar-wiz)"/>
  <g>
    <rect x="522" y="30" width="110" height="70" rx="8" class="dg-box"/>
    <circle cx="577" cy="20" r="11" class="dg-accent"/><text x="577" y="24" class="dg-tw dg-s dg-b" text-anchor="middle">5</text>
    <text x="577" y="58" class="dg-ts dg-b" text-anchor="middle">Terapi &amp;</text><text x="577" y="72" class="dg-ts dg-b" text-anchor="middle">Resep</text>
    <text x="577" y="90" class="dg-ts" text-anchor="middle">resep terstruktur</text>
  </g>
  <line x1="632" y1="65" x2="648" y2="65" class="dg-arrow" marker-end="url(#ar-wiz)"/>
  <g>
    <rect x="650" y="30" width="100" height="70" rx="8" class="dg-box-green"/>
    <circle cx="700" cy="20" r="11" class="dg-accent"/><text x="700" y="24" class="dg-tw dg-s dg-b" text-anchor="middle">6</text>
    <text x="700" y="58" class="dg-ts dg-b" text-anchor="middle">Pembelajaran</text><text x="700" y="72" class="dg-ts dg-b" text-anchor="middle">&amp; Bukti</text>
    <text x="700" y="90" class="dg-ts" text-anchor="middle">unggah berkas</text>
  </g>
  <text x="380" y="130" class="dg-lbl" text-anchor="middle">Penanda langkah dapat diklik untuk melompat. Simpan Draf tersedia di langkah mana pun; galat validasi menunjuk langkah yang bermasalah.</text>
</svg>

| Langkah | Isian |
|---|---|
| 1. Identitas & Demografi | Tanggal kasus*, Keluhan utama*, kelompok usia (Anak/Dewasa/Lansia), jenis kelamin, **usia** dan **pekerjaan** pasien (tidak sensitif, tampil terbuka), setting klinis (Rawat Jalan, Rawat Inap, IGD, ICU, Kamar Operasi, Pelayanan Primer), kompleksitas (Rendah/Sedang/Tinggi), blok **Identitas Pasien** (nama, No. RM, tanggal lahir, telepon, alamat) yang disimpan **terenkripsi**, dan **Dosen/Preseptor Pembimbing** (opsional — lihat di bawah). |
| 2. Anamnesis, PF & Tanda Vital | Anamnesis, keadaan umum, pemeriksaan fisik, riwayat keluarga, tanda vital (suhu, TD, nadi, respirasi, BB, TB) — **BMI** dihitung otomatis. |
| 3. Pemeriksaan Penunjang | Hasil laboratorium, radiologi, pemeriksaan lain. |
| 4. Diagnosis & Tatalaksana | Diagnosis (isian ber-autocomplete dari **Master Diagnosis**; kode ICD-10 dan level SKDI terisi otomatis bila cocok) dan tatalaksana. |
| 5. Terapi & Resep | Latihan menulis resep: nama obat (autocomplete dari **Master Obat**), sediaan, kekuatan, jumlah, rute, aturan pakai (signa), catatan. Baris yang sama sekali kosong dibuang otomatis; baris terisi sebagian tanpa nama obat ditandai dan harus dilengkapi. **Pratinjau resep** langsung menyusun isian menjadi format resep, mis. `R/ Parasetamol tab 500 mg No. X` dan `S 3 dd tab I p.c.` — sediaan otomatis disingkat (Tablet → tab, Kapsul → kaps, Sirup → syr, dst.), sama dengan resep yang tersimpan. |
| 6. Pembelajaran & Bukti | Poin pembelajaran dan unggahan berkas bukti (gambar, PDF, Word, PowerPoint, Excel; maks. 10 MB per berkas, 10 berkas). Berkas baru ditambahkan — menyunting kasus tidak menghapus bukti yang sudah ada. |

![Langkah 1 wizard Kasus Klinis Baru, termasuk blok Identitas Pasien yang disimpan terenkripsi dan kolom Dosen/Preseptor Pembimbing](panduan/4-3-wizard-kasus.png)

> Setting klinis menentukan jenis fasilitas: **Pelayanan Primer → FKTP**, selainnya **FKRTL** — inilah dasar kartu Pemenuhan Target Kasus.

#### Alur status kasus

<svg class="dg" viewBox="0 0 760 300" role="img" aria-label="Alur status kasus klinis dari draf hingga terverifikasi">
  <defs><marker id="ar-case" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <rect x="10" y="110" width="110" height="50" rx="10" class="dg-box-gray"/>
  <text x="65" y="140" class="dg-t dg-b" text-anchor="middle">Draf</text>
  <text x="65" y="180" class="dg-ts" text-anchor="middle">bisa dihapus</text>
  <rect x="260" y="110" width="170" height="50" rx="10" class="dg-box-amber"/>
  <text x="345" y="132" class="dg-t dg-b" text-anchor="middle">Menunggu Verifikasi</text>
  <text x="345" y="150" class="dg-ts" text-anchor="middle">antrean pembimbing</text>
  <rect x="570" y="20" width="180" height="50" rx="10" class="dg-box-green"/>
  <text x="660" y="42" class="dg-t dg-b" text-anchor="middle">Terverifikasi</text>
  <text x="660" y="60" class="dg-ts" text-anchor="middle">level entrustment + EPA</text>
  <rect x="570" y="120" width="180" height="50" rx="10" class="dg-box"/>
  <text x="660" y="142" class="dg-t dg-b" text-anchor="middle">Perlu Revisi</text>
  <text x="660" y="160" class="dg-ts" text-anchor="middle">bisa disunting lagi</text>
  <rect x="570" y="225" width="180" height="50" rx="10" class="dg-box-red"/>
  <text x="660" y="247" class="dg-t dg-b" text-anchor="middle">Ditolak</text>
  <text x="660" y="265" class="dg-ts" text-anchor="middle">final, bukan bukti</text>
  <line x1="120" y1="135" x2="258" y2="135" class="dg-arrow" marker-end="url(#ar-case)"/>
  <text x="189" y="127" class="dg-lbl" text-anchor="middle">Kirim untuk Verifikasi</text>
  <line x1="430" y1="122" x2="568" y2="50" class="dg-arrow" marker-end="url(#ar-case)"/>
  <text x="478" y="74" class="dg-lbl" text-anchor="middle">Setujui / Verifikasi</text>
  <line x1="430" y1="138" x2="568" y2="143" class="dg-arrow" marker-end="url(#ar-case)"/>
  <text x="499" y="131" class="dg-lbl" text-anchor="middle">Minta Revisi</text>
  <line x1="430" y1="152" x2="568" y2="245" class="dg-arrow" marker-end="url(#ar-case)"/>
  <text x="534" y="226" class="dg-lbl" text-anchor="middle">Tolak Kasus</text>
  <path d="M620,170 L620,195 L345,195 L345,162" fill="none" class="dg-arrow dg-dash" marker-end="url(#ar-case)"/>
  <text x="440" y="208" class="dg-lbl" text-anchor="middle">sunting → Kirim lagi</text>
  <path d="M570,35 L345,35 L345,108" fill="none" class="dg-arrow dg-dash" marker-end="url(#ar-case)"/>
  <text x="455" y="29" class="dg-lbl" text-anchor="middle">Batalkan Verifikasi (verifier asal / admin)</text>
  <text x="380" y="288" class="dg-lbl" text-anchor="middle">Setiap transisi tercatat di Riwayat Verifikasi; Komentar bisa ditambahkan kapan saja oleh pemilik &amp; pembimbing.</text>
</svg>

- **Draf** dan **Perlu Revisi** dapat Anda sunting; **Draf** dapat dihapus (refleksi yang menautkan draf itu tetap tersimpan, hanya tautannya dilepas). Draf hanya terlihat oleh Anda (dan admin) — pembimbing baru dapat membuka kasus setelah dikirim.
- **Kirim untuk Verifikasi** mengirim kasus ke antrean pembimbing. Bila Anda menandai **Dosen/Preseptor Pembimbing**, kasus hanya masuk antrean dia, dia menerima notifikasi, dan **hanya dia** yang dapat memverifikasi, meminta revisi, atau menolaknya; tanpa tanda, kasus masuk antrean semua pembimbing. Tanda dapat diubah selama kasus masih Draf atau Perlu Revisi. Setelah dikirim, kasus tidak bisa disunting sampai diminta revisi.
- **Terverifikasi** membawa **level entrustment** (Diobservasi … Mengajari Junior), catatan pembimbing, kemungkinan **rekomendasi remediasi**, dan bila pembimbing memilih ranah EPA, **Peta EPA Anda ikut terisi**.
- **Ditolak** bersifat final (kasus tidak layak dijadikan bukti, mis. duplikat).
- **Riwayat Verifikasi** menampilkan setiap transisi beserta catatannya; **Kirim Komentar** memungkinkan diskusi dengan pembimbing tanpa mengubah status.

![Halaman kasus terverifikasi: Persetujuan Pasien, permintaan Mini-CEX/DOPS, Riwayat & Diskusi Verifikasi, dan isi kasus](panduan/4-3-detail-kasus.png)

#### Identitas pasien, Privacy Mode, dan Break Glass

Selama **Contextual Privacy Mode** menyala (bawaan), identitas pasien tampil **tersamar untuk semua orang termasuk Anda sendiri**: nama menjadi inisial (`AF***`), No. RM menjadi `RM-****56`, sisanya `••••`. Satu-satunya pengecualian adalah pembimbing kasus Anda — pembimbing yang Anda tandai, preseptor rotasi pada tanggal kasus, dan dosen yang memverifikasinya — yang melihat identitas langsung. Untuk membukanya sesaat, klik **Break Glass**, tulis alasan (minimal 10 karakter), dan identitas terbuka **30 menit** pada akun Anda. Setiap pembukaan tercatat permanen (siapa, kapan, alasan, alamat IP) dan dapat dilihat admin. Rincian ada di [Bab 7](#bab-7--privasi--keamanan-data-pasien).

![Panel Identitas Pasien yang tersamar oleh Privacy Mode — nama menjadi inisial, No. RM terpotong — dengan tombol Break Glass](panduan/4-3-privacy-break-glass.png)

#### Persetujuan pasien lewat QR

Pada kasus yang sudah tersimpan, klik **Terbitkan QR Persetujuan**. Pasien memindai QR (atau membuka tautannya) di ponselnya **tanpa login**, mencentang tiga butir — data kasus dipakai untuk pendidikan, foto klinis boleh disertakan, kasus boleh dipublikasikan setelah dianonimkan — lalu menulis nama dan relasi (pasien sendiri / wali). Jawaban tampil butir per butir di halaman kasus; nama yang ditulis pasien disimpan terenkripsi dan ikut tersamar oleh Privacy Mode. Lembar hanya dapat dijawab sekali. Bila ada lampiran tetapi foto tidak disetujui, halaman memberi peringatan. **Terbitkan ulang** membatalkan lembar lama, termasuk bila pasien ingin mengubah jawabannya; **Cabut** menarik persetujuan.

![Panel Persetujuan Pasien di halaman kasus: QR, tautan persetujuan, dan status Menunggu jawaban pasien](panduan/4-3-qr-persetujuan.png)

![Lembar Persetujuan Pasien di ponsel, tanpa login: tiga butir persetujuan, nama, hubungan dengan pasien, dan tombol Kirim Jawaban](panduan/4-3-lembar-persetujuan.png)

#### Meminta asesmen dari kasus

Kasus berstatus *Menunggu Verifikasi* atau *Terverifikasi* dapat menjadi bahan asesmen:

- **Minta Mini-CEX** / **Minta DOPS** (isi nama prosedur): permintaan dikirim ke **preseptor rotasi** yang mencakup tanggal kasus (atau rotasi yang sedang berjalan). Konteks klinis tersalin dari kasus; statusnya *Diminta* sampai penilai mengisi rubrik. Permintaan yang belum disentuh penilai bisa Anda batalkan.
- **Inisiasi CBD / Long Case**: pilih event berbasis kasus yang tersedia untuk prodi/blok Anda. Kasus langsung tertaut dan berstatus *Dikumpulkan*; penguji terisi dari verifier kasus atau preseptor rotasi aktif.

![Panel Mini-CEX & DOPS dari kasus dengan nama penilai bawaan dan tombol Minta Mini-CEX / Minta DOPS](panduan/4-3-minta-asesmen.png)

### 4.4 Longitudinal Portfolio

**Ikhtisar → Longitudinal Portfolio** (`/portfolio`) merangkum seluruh Logbook Kegiatan: total kegiatan, jumlah **Klinis vs Non-Klinis**, **Tren 6 Bulan Terakhir**, jenis kegiatan terbanyak, dan tombol **Unduh CSV** untuk mengekspor seluruh kegiatan.

![Longitudinal Portfolio: total kegiatan, Klinis vs Non-Klinis, tren 6 bulan, dan jenis kegiatan terbanyak](panduan/4-4-portfolio.png)

### 4.5 Rotasi Klinik dan Enrolment Tutorial

- **Rotasi Klinik** (`/clinical_rotations`): jadwal stase Anda — bagian/departemen, wahana, preseptor, periode, tanggal — dengan status **Akan Datang / Sedang Berlangsung / Selesai** yang dihitung dari tanggal. Rotasi hanya dibuat admin. Rotasi berjalan dipakai untuk: pengingat kasus di beranda, penilai bawaan DOPS/Mini-CEX, dan pencocokan event asesmen berdasarkan nama stase.
- **Enrolment Tutorial** (`/tutorial_enrollments`): padanan untuk tahap sarjana — blok/sistem, dosen tutor, periode, status Aktif/Selesai. Enrolment aktif menjadikan Anda "mahasiswa bimbingan" tutor di Dashboard Analitik dan menentukan event asesmen blok yang tampil.

![Jadwal Rotasi dengan status Sedang Berlangsung, wahana, dan preseptor](panduan/4-5-rotasi-klinik.png)

![Enrolment Tutorial aktif dengan blok/sistem, periode, dan dosen tutor](panduan/4-5-enrolment-tutorial.png)

### 4.6 Refleksi

**Perjalanan Belajar → Refleksi** (`/reflection_entries`) adalah jurnal tersendiri: tanggal, judul (opsional), isi bebas, dan tautan opsional ke satu **kegiatan** atau **kasus klinis**. Berbeda dari kolom "Refleksi" singkat di formulir kegiatan; gunakan ini untuk refleksi yang lebih panjang atau lintas kegiatan. Hanya Anda yang dapat membacanya.

![Jurnal Refleksi dengan tombol Tulis Refleksi](panduan/4-6-refleksi.png)

Tautan hanya dapat dibuat ke kegiatan dan kasus **milik Anda sendiri**. Bila kegiatan atau draf kasus yang ditautkan kemudian dihapus, refleksi tetap tersimpan tanpa tautan.

### 4.7 Tugas Akhir

**Perjalanan Belajar → Tugas Akhir** (`/final_projects`):

1. **Daftarkan** tugas akhir: judul, deskripsi, dosen pembimbing (opsional; harus akun berperan **Dosen**, bukan diri sendiri), status **Proposal / Berjalan / Selesai**.
2. Tambahkan **milestone** bertanggal (checklist); tandai selesai atau buka lagi. Milestone yang lewat tanggal tanpa selesai ditandai **terlambat**.
3. **Skor ujian** diberikan penguji (0–100 + umpan balik per sesi; boleh lebih dari satu penguji). Rata-rata skor tampil di halaman proyek dan Anda menerima notifikasi setiap skor baru.

![Halaman tugas akhir: status, pembimbing, milestone bertanggal, dan skor ujian](panduan/4-7-tugas-akhir.png)

Proyek berstatus Proposal dapat Anda hapus; pembimbing dan admin juga dapat menyunting proyek Anda.

### 4.8 Evaluasi Akademik (nilai ujian)

**Asesmen & Evaluasi → Evaluasi Akademik** (`/nilai-ujian`) menampilkan seluruh nilai Anda **per tipe asesmen** beserta **tren persentase** dan daftar **asesmen menunggu** (terdaftar/dikumpulkan tetapi belum dinilai). Nilai masuk lewat tiga jalur — impor CSV oleh admin (CBT, OSCE, Progress Test, dsb.), Lembar Penguji (rubrik), atau inisiasi dari kasus (CBD/Long Case). Bila event mengizinkan percobaan berulang, nilai **tertinggi** yang menjadi wakil.

![Evaluasi Akademik: asesmen menunggu dan nilai per tipe asesmen dengan tautan Detail & radar](panduan/4-8-evaluasi-akademik.png)

Empat belas tipe instrumen yang dikenal:

| Keluarga | Tipe | Cara nilai masuk |
|---|---|---|
| Ujian tulis | Ujian Tulis / CBT, Nilai Tutor, Ujian Tinjauan, TMEX, Progress Test | Impor CSV admin (termasuk berkas *CBT Exam Results* format Glide) |
| Ujian praktik | OSCE | Impor CSV admin (bisa per station, atau berkas *Penilaian OSCE* format Glide — 8 dimensi klinis) |
| Rubrik penguji | SOCA/MSP, Essay Gagasan, Festival Gagasan, Community Project, Refleksi Mahasiswa (dinilai), EBCR | Mahasiswa mengumpulkan → penguji menilai |
| Berbasis kasus | CBD, Long Case | Diinisiasi dari Kasus Klinis → penguji menilai |

Membuka satu nilai menampilkan **posisi Anda di kohort ujian** (persentil, rerata, P90) dan **radar per kategori dimensi**. Untuk CBT hasil impor, radar dikelompokkan per kategori tinjauan — Area Kompetensi, Sistem Organ, Sistem Kesehatan, Proses Klinis & Kognitif, Patomekanisme, dst. Untuk OSCE, halaman yang sama memuat **Rincian Station OSCE**: tiap station dengan kasus, penguji, delapan dimensi klinis (skala 0–3; nilai di bawah 2 ditandai merah), nilai checklist, *global rating* (Fail / Borderline / Good / Superior), serta umpan balik **Yang sudah baik** dan **Perlu ditingkatkan** dari penguji. Nilai OSCE Anda adalah rata-rata nilai checklist seluruh station pada sesi itu.

### 4.9 Workplace Assessment (DOPS & Mini-CEX)

**Asesmen & Evaluasi → Workplace Assessment** (`/asesmen`) menampilkan seluruh DOPS dan Mini-CEX Anda. Keduanya dinilai per dimensi pada skala **1–9** (1–3 di bawah harapan, 4–6 sesuai harapan, 7–9 melebihi harapan) beserta umpan balik naratif; halaman rincian menampilkan **radar chart** dimensi.

![Workplace Assessment: daftar DOPS dan Mini-CEX terbaru beserta skor rata-rata](panduan/4-9-workplace-assessment.png)

![Rincian Mini-CEX: radar Peta Dimensi dan skor tiap dimensi pada skala 1–9](panduan/4-9-detail-mini-cex.png)

| | DOPS | Mini-CEX |
|---|---|---|
| Objek | satu prosedur (nama dari Master Keterampilan) | satu pertemuan pasien |
| Dimensi | 10: persetujuan tindakan, persiapan, analgesia/sedasi, kemampuan teknis, asepsis & keamanan pasien, meminta bantuan, evaluasi pasca tindakan, komunikasi, profesionalisme, penilaian global | 6: anamnesis, pemeriksaan fisik, clinical judgment, komunikasi, profesionalisme, organisasi & efisiensi + **penilaian global kualitatif** (Perlu Banyak Perbaikan … Melebihi Harapan) |
| Dimensi wajib | komunikasi, profesionalisme, penilaian global | komunikasi, profesionalisme |
| Konteks | setting klinis, kelompok usia, kompleksitas, durasi observasi & umpan balik, tautan rekaman video | sama |

<svg class="dg" viewBox="0 0 760 190" role="img" aria-label="Siklus status DOPS dan Mini-CEX: Diminta, Draf, Terkirim">
  <defs><marker id="ar-wba" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <rect x="10" y="30" width="180" height="56" rx="10" class="dg-box-amber"/>
  <text x="100" y="52" class="dg-t dg-b" text-anchor="middle">Diminta</text>
  <text x="100" y="70" class="dg-ts" text-anchor="middle">mahasiswa minta dari kasus</text>
  <rect x="290" y="30" width="180" height="56" rx="10" class="dg-box-gray"/>
  <text x="380" y="52" class="dg-t dg-b" text-anchor="middle">Draf</text>
  <text x="380" y="70" class="dg-ts" text-anchor="middle">penilai mulai mengisi rubrik</text>
  <rect x="570" y="30" width="180" height="56" rx="10" class="dg-box-green"/>
  <text x="660" y="52" class="dg-t dg-b" text-anchor="middle">Terkirim</text>
  <text x="660" y="70" class="dg-ts" text-anchor="middle">notifikasi; masuk radar &amp; jurnal</text>
  <line x1="190" y1="58" x2="288" y2="58" class="dg-arrow" marker-end="url(#ar-wba)"/>
  <text x="240" y="50" class="dg-lbl" text-anchor="middle">Simpan Draf</text>
  <line x1="470" y1="58" x2="568" y2="58" class="dg-arrow" marker-end="url(#ar-wba)"/>
  <text x="520" y="50" class="dg-lbl" text-anchor="middle">Kirim Evaluasi</text>
  <rect x="290" y="125" width="180" height="44" rx="10" class="dg-box"/>
  <text x="380" y="143" class="dg-t dg-b" text-anchor="middle">Penilai membuat langsung</text>
  <text x="380" y="159" class="dg-ts" text-anchor="middle">+ DOPS / + Mini-CEX di /asesmen</text>
  <line x1="380" y1="125" x2="380" y2="88" class="dg-arrow" marker-end="url(#ar-wba)"/>
  <path d="M470,147 L660,147 L660,88" fill="none" class="dg-arrow" marker-end="url(#ar-wba)"/>
  <text x="565" y="141" class="dg-lbl" text-anchor="middle">langsung kirim</text>
  <text x="100" y="125" class="dg-ts" text-anchor="middle">Mahasiswa boleh membatalkan</text>
  <text x="100" y="139" class="dg-ts" text-anchor="middle">selama masih "Diminta"</text>
</svg>

Notifikasi ke Anda **baru terkirim saat evaluasi berstatus Terkirim** — draf penilai tidak memicu notifikasi. Jadwal DOPS/Mini-CEX yang direncanakan admin/kaprodi tampil di **Agenda Mendatang** beranda saat jadwalnya tinggal 7 hari lagi.

### 4.10 Rubric-based Assessment (Asesmen Saya)

**Asesmen & Evaluasi → Rubric-based Assessment** (`/student/assessments`) memuat event **rubrik** dan **berbasis kasus** yang tersedia untuk Anda (prodi cocok, blok/stase cocok dengan enrolment/rotasi aktif, pengumpulan masih terbuka) dan seluruh percobaan Anda.

<svg class="dg" viewBox="0 0 760 200" role="img" aria-label="Alur asesmen rubrik dari pendaftaran hingga dinilai">
  <defs><marker id="ar-rub" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <rect x="10" y="30" width="150" height="56" rx="10" class="dg-box"/>
  <text x="85" y="52" class="dg-t dg-b" text-anchor="middle">Event Terbit</text>
  <text x="85" y="70" class="dg-ts" text-anchor="middle">admin; periode/prodi/blok</text>
  <rect x="200" y="30" width="150" height="56" rx="10" class="dg-box-gray"/>
  <text x="275" y="52" class="dg-t dg-b" text-anchor="middle">Terdaftar</text>
  <text x="275" y="70" class="dg-ts" text-anchor="middle">mahasiswa klik Daftar</text>
  <rect x="390" y="30" width="150" height="56" rx="10" class="dg-box-amber"/>
  <text x="465" y="52" class="dg-t dg-b" text-anchor="middle">Dikumpulkan</text>
  <text x="465" y="70" class="dg-ts" text-anchor="middle">dokumen + evaluasi diri</text>
  <rect x="580" y="30" width="170" height="56" rx="10" class="dg-box-green"/>
  <text x="665" y="52" class="dg-t dg-b" text-anchor="middle">Dinilai</text>
  <text x="665" y="70" class="dg-ts" text-anchor="middle">nilai + pertahankan/tingkatkan</text>
  <line x1="160" y1="58" x2="198" y2="58" class="dg-arrow" marker-end="url(#ar-rub)"/>
  <line x1="350" y1="58" x2="388" y2="58" class="dg-arrow" marker-end="url(#ar-rub)"/>
  <line x1="540" y1="58" x2="578" y2="58" class="dg-arrow" marker-end="url(#ar-rub)"/>
  <rect x="200" y="130" width="230" height="44" rx="10" class="dg-box"/>
  <text x="315" y="148" class="dg-t dg-b" text-anchor="middle">Inisiasi CBD / Long Case dari kasus</text>
  <text x="315" y="164" class="dg-ts" text-anchor="middle">kasus = dokumennya; langsung Dikumpulkan</text>
  <path d="M430,152 L465,152 L465,88" fill="none" class="dg-arrow" marker-end="url(#ar-rub)"/>
  <text x="600" y="120" class="dg-ts" text-anchor="middle">Setelah dinilai: notifikasi, masuk Evaluasi Akademik,</text>
  <text x="600" y="134" class="dg-ts" text-anchor="middle">Jurnal Umpan Balik, dan posisi terhadap kohort</text>
</svg>

1. Klik **Daftar** pada event yang tersedia (percobaan baru; bila event mengizinkan percobaan berulang, Anda dapat mendaftar lagi setelah dinilai).
2. Buka percobaan, **unggah dokumen** (PDF/Word/PowerPoint/Excel atau gambar, maks. 20 MB) dan/atau tulis **evaluasi diri**, lalu **Kumpulkan**. Penguji yang ditunjuk menerima notifikasi; bila belum ada penguji, penguji mana pun dapat mengambilnya.
3. Setelah dinilai, halaman percobaan menampilkan nilai, umpan balik **pertahankan / tingkatkan**, rubrik yang diisi penguji (bila event memakai Assessment Form), dan **posisi Anda terhadap kohort** untuk event itu.

![Rubric-based Assessment: event tersedia dan riwayat asesmen dengan status, nilai, dan penguji](panduan/4-10-asesmen-saya.png)

### 4.11 Jurnal Umpan Balik

**Asesmen & Evaluasi → Jurnal Umpan Balik** (`/student/feedback_journal`) menyatukan seluruh umpan balik tertulis — rubrik, CBD/Long Case, DOPS, Mini-CEX — dalam satu linimasa kronologis beserta skor dan nama penguji. Gunakan sebagai bahan refleksi.

![Jurnal Umpan Balik Penguji dalam satu linimasa](panduan/4-11-jurnal-umpan-balik.png)

### 4.12 Formulir evaluasi (Assessment Form)

**Assessment Form Builder** (`/assessment_form_templates`) — termasuk membuka dan mengisi formulir seperti **Evaluasi Dosen Tutor** dan **Evaluasi Blok** — hanya dapat diakses **kaprodi dan admin**; menunya tidak tampil bagi mahasiswa. Jawaban yang pernah Anda kirim, atau lembar yang menilai Anda, tetap dapat dibuka di `/assessment_form_submissions`; pada formulir **anonim**, identitas responden hanya terlihat oleh responden sendiri dan admin.

![Halaman Jawaban Formulir Saya berisi formulir Evaluasi Blok yang pernah dikirim](panduan/4-12-jawaban-formulir.png)

### 4.13 Peta Kompetensi (Analisis Capaian Pembelajaran)

**Kompetensi & Prestasi → Peta Kompetensi** (`/capaian-belajar`) adalah potret pribadi **satu periode akademik** (pilih dari dropdown). Sengaja tidak ada grafik tren antar-periode, karena jenis dan bobot asesmen berganti tiap periode sehingga tren rata-ratanya menyesatkan.

Isinya:

- **Radar DOPS & Mini-CEX** periode itu (rata-rata per dimensi) beserta daftar evaluasinya per rotasi.
- **Target milestone** per ranah kompetensi yang ditetapkan admin, dengan lencana **Tercapai / Di Bawah Target** — dibandingkan dengan rata-rata keseluruhan DOPS+Mini-CEX Anda (proksi umum, dilabeli demikian).
- **Nilai ujian** periode itu (dari Assessment Events).
- **Capaian per ranah kompetensi** dari mata uji/station yang dipetakan admin ke ranah.
- **Nilai Learning Unit** (blok/modul) dari Assessment Matrix: rata-rata terbobot komponen yang **sudah dinilai**, dilabeli "dari X% bobot".
- **Posisi terhadap Kohort**: pita P10–P90, median, dan penanda posisi Anda, **per tipe asesmen dalam satu periode**; hanya tampil bila kohort ≥ 3 mahasiswa (agar nilai perorangan tak bisa diterka).

![Analisis Capaian Pembelajaran: pilihan periode, rata-rata DOPS & Mini-CEX, radar kompetensi, dan nilai asesmen periode](panduan/4-13-peta-kompetensi.png)

### 4.14 Peta EPA & Tingkat Entrustment

**Kompetensi & Prestasi → Peta EPA & Entrustment** (`/dashboard/entrustment`) menampilkan tingkat entrustment Anda **1–5** untuk setiap ranah tingkat atas Kerangka Kompetensi, plus riwayat keputusannya:

| Level | Makna |
|---|---|
| 1 | Hanya mengamati, tidak boleh terlibat |
| 2 | Boleh terlibat dengan supervisi penuh |
| 3 | Bisa mandiri dengan supervisi tidak langsung |
| 4 | Mandiri penuh |
| 5 | Mampu mengajarkan dan mensupervisi junior |

![Peta EPA & Tingkat Entrustment per ranah kompetensi](panduan/4-14-peta-epa.png)

Keputusan baru **menggantikan** yang lama (riwayat tetap tersimpan). Sumbernya dua: otomatis saat pembimbing memverifikasi kasus dan memilih ranah EPA (level entrustment kasus dipetakan ke 1–5), atau manual oleh pembimbing yang berelasi dengan Anda. Bila verifikasi kasus dibatalkan, level yang lahir dari kasus itu dicabut dan keputusan sebelumnya dipulihkan.

### 4.15 Kesehatan Mental (SRQ-20)

**Perjalanan Belajar → Kesehatan Mental (SRQ)** (`/kesehatan-mental`) adalah skrining mandiri 20 pertanyaan ya/tidak tentang kondisi Anda selama 30 hari terakhir. Pengisian bersifat **sukarela**, dan hasilnya adalah penapisan, **bukan diagnosis**. Menu ini tampil setelah kaprodi mengaktifkannya untuk prodi Anda.

1. Klik **Isi SRQ-20**, jawab semua pertanyaan, lalu centang persetujuan.
2. Klik **Kirim Jawaban**. Skor adalah jumlah jawaban "ya". Anda dapat mengisi paling banyak sekali sehari, dan riwayatnya tersimpan.

![Formulir SRQ-20: 20 pertanyaan ya/tidak dan persetujuan sebelum mengirim](panduan/4-15-isi-srq.png)

| Kategori | Arti |
|---|---|
| **Di Bawah Ambang** | Skor kurang dari 6 |
| **Perlu Tindak Lanjut** | Skor 6 atau lebih |
| **Perlu Perhatian Segera** | Jawaban "ya" pada pertanyaan tentang pikiran mengakhiri hidup, berapa pun skornya |

![Hasil SRQ-20: skor, kategori, dan penjelasan tindak lanjut](panduan/4-15-hasil-srq.png)

Bila Anda membutuhkan bantuan, hubungi konselor fakultas atau **119 ekstensi 8** (Healing119, layanan konseling kesehatan jiwa Kemenkes). Bila merasa tidak aman saat ini, segera ke IGD terdekat.

Dengan persetujuan Anda, **skor dan kategori** terlihat oleh kaprodi prodi Anda untuk tindak lanjut, termasuk tanda perlu perhatian segera. Jawaban per butir hanya terlihat oleh Anda. Pengguna lain, termasuk dosen dan admin, tidak melihat hasil Anda. Data ini tersimpan terenkripsi dan tidak ikut ekspor data.

---

## Bab 5 — Panduan Pembimbing (Dosen, Preseptor, Kaprodi)

### 5.1 Beranda pembimbing

Beranda dosen, preseptor, kaprodi, dan admin mengikuti pola beranda pembimbing jejak.pro:

- **Langkah Penyiapan** (admin dan kaprodi) — daftar pekerjaan penyiapan yang belum selesai, dihitung dari data sungguhan. Hilang sendiri setelah langkah wajib beres. Lihat [Panduan Penyiapan](#panduan-penyiapan-untuk-kaprodi--admin-prodi).
- **Ringkasan Hari Ini** — kartu angka yang hanya "menyala" bila ada pekerjaan; kartu bernilai nol menampilkan *✓ Beres*:
  - **Kasus Perlu Diverifikasi** dan **Kegiatan Perlu Divalidasi** — antrean yang sama dengan menu Validasi Kasus Klinis / Validasi Kegiatan, tanpa kasus/kegiatan milik akun Anda sendiri (tidak tampil bagi kaprodi tanpa peran pengajar, yang juga tidak melihat menu Validasi).
  - **Perlu Dinilai** — DOPS/Mini-CEX yang diminta mahasiswa atau masih draf dengan Anda sebagai penilai, ditambah percobaan asesmen (rubrik, CBD, Long Case) yang sudah dikumpulkan dan ditugaskan kepada Anda.
  - **Mahasiswa Perlu Perhatian** — lihat di bawah.
  - **Jadwal Evaluasi Prodi** (preseptor, atau siapa pun yang punya jadwal) — jadwal DOPS/Mini-CEX sampai akhir bulan yang belum ditunaikan.
  - **Agenda 7 Hari**.
- **Perlu Tindakan Anda** — panel untuk tiap antrean di atas (kasus terlama menunggu tampil paling atas; tombol *Isi Penilaian* langsung ke lembarnya). Bila semuanya kosong, tampil keadaan **Semua beres**.
- **Mahasiswa Perlu Perhatian Khusus** — mahasiswa bimbingan (kaprodi: ditambah seluruh mahasiswa prodinya) yang dalam **30 hari terakhir** punya kasus terverifikasi dengan **rekomendasi remediasi**, atau rata-rata DOPS/Mini-CEX **di bawah 4**; bagi preseptor juga mahasiswa rotasinya yang **7 hari** tidak mencatat kasus.
- **Mahasiswa Bimbingan Anda** — dikelompokkan per peran: **Modul Preseptor Klinis** (rotasi yang sedang berjalan), **Modul Tutor** (blok aktif), dan **Pembimbing Tugas Akhir** (progres milestone). Tiap mahasiswa bertaut ke Dasbor Mahasiswa (hanya-baca).
- Kolom samping: **Agenda Mendatang**, **Ringkasan Bimbingan** (jumlah mahasiswa per peran dan rekam umpan balik naratif Anda), serta **Akses Cepat** (admin mendapat tautan Jadwal DOPS & Mini-CEX dan Pengguna).

![Beranda pembimbing: Ringkasan Hari Ini, Perlu Tindakan Anda, Agenda Mendatang, dan Ringkasan Bimbingan](panduan/5-1-beranda-pembimbing.png)

Jadwal DOPS/Mini-CEX di panel *Jadwal Evaluasi Bulan Ini* hilang sendiri begitu Anda mengirim penilaian sejenis untuk mahasiswa tersebut sejak awal bulan jadwalnya — tidak perlu menunggu admin menandainya Selesai.

### 5.2 Validasi Kasus Klinis

**Coaching Center → Validasi Kasus Klinis** (`/clinical_cases?scope=to_verify`) adalah antrean kasus berstatus *Menunggu Verifikasi* yang menandai Anda sebagai pembimbing, ditambah kasus tanpa tanda pembimbing dari mahasiswa mana pun. Kasus yang menandai pengajar lain tidak masuk antrean Anda dan tidak dapat Anda verifikasi. Buka kasus, baca seluruh langkah, lalu pilih salah satu:

| Aksi | Kapan | Efek |
|---|---|---|
| **Setujui / Verifikasi** | kasus layak | Pilih **level entrustment** (Diobservasi, Dibantu, Supervisi Langsung, Supervisi Tidak Langsung, Mandiri, Mengajari Junior), tulis catatan, centang **Rekomendasi remediasi** bila perlu, dan centang **ranah EPA** yang ingin ditulis ke Peta EPA mahasiswa. |
| **Minta Revisi** | ada yang perlu diperbaiki (catatan wajib) | Kasus kembali dapat disunting mahasiswa dan dikirim ulang. |
| **Tolak Kasus** | kasus tidak layak menjadi bukti (alasan wajib) | Final. |
| **Batalkan Verifikasi** | Anda (verifier asal) atau admin salah menyetujui (alasan wajib) | Kasus kembali ke antrean; level EPA dari verifikasi itu dicabut. |
| **Kirim Komentar** | diskusi tanpa mengubah status | Pemilik/verifier menerima notifikasi. |

![Antrean Validasi Kasus Klinis (tab Perlu Diverifikasi)](panduan/5-2-validasi-kasus.png)

![Panel Verifikasi Kasus: tingkat entrustment, rekomendasi remediasi, ranah EPA, Setujui, Minta Revisi, dan Tolak](panduan/5-2-form-verifikasi.png)

Kasus yang sudah Anda verifikasi, minta revisi, atau tolak keluar dari antrean, tetapi tetap bisa dibuka ulang lewat tab **Riwayat Verifikasi** (`/clinical_cases?scope=reviewed`) di halaman yang sama.

![Tab Riwayat Verifikasi: kasus yang sudah Anda putuskan, dengan status dan nama pembimbing](panduan/5-2-riwayat-verifikasi.png)

Anda tidak dapat memverifikasi kasus milik akun sendiri — kasus itu juga tidak masuk antrean Anda — dan **draf** mahasiswa tidak dapat dibuka sebelum dikirim. Bila Anda pembimbing kasus itu — yang ditandai mahasiswa, preseptor rotasi mahasiswa pada tanggal kasus, atau dosen yang sudah memverifikasi, meminta revisi, atau menolaknya — identitas pasien tampil langsung. Pengajar lain melihatnya tersamar oleh Privacy Mode; gunakan Break Glass hanya bila benar-benar perlu — semua pembukaan Break Glass diaudit.

### 5.3 Validasi Kegiatan

**Coaching Center → Validasi Kegiatan** (`/activity_logs?scope=to_verify`) memuat kegiatan logbook yang belum diverifikasi dari semua mahasiswa (kegiatan milik akun Anda sendiri tidak ikut), dengan filter domain dan kompetensi. Buka kegiatan, periksa bukti/tautan, klik **Verifikasi**. Tidak ada aksi "tolak" — kegiatan yang tidak layak cukup dibiarkan tanpa verifikasi dan dibicarakan dengan mahasiswa.

![Validasi Kegiatan: kegiatan mahasiswa yang belum diverifikasi, dengan filter domain dan kompetensi](panduan/5-3-validasi-kegiatan.png)

### 5.4 Menilai DOPS dan Mini-CEX

Dari **Workplace Assessment** (`/asesmen`) klik **+ DOPS** atau **+ Mini-CEX**, atau buka permintaan mahasiswa dari kartu *Evaluasi Belum Dikirim*. Panel **Menunggu Diselesaikan** memuat permintaan dan draf Anda.

1. Pilih mahasiswa dan rotasi klinik. Daftar rotasi bertuliskan *stase — nama mahasiswa*; pilih rotasi **milik mahasiswa yang dinilai** — rotasi mahasiswa lain ditolak, karena nilainya akan salah atribusi dan tidak terhitung di Dashboard Analitik. Pada permintaan dari kasus, keduanya sudah terisi beserta konteks klinis.
2. Isi tanggal, nama prosedur (DOPS, dengan autocomplete Master Keterampilan) atau deskripsi kasus (Mini-CEX), setting klinis, kelompok usia, kompleksitas, durasi observasi & umpan balik, tautan video (opsional).
3. Beri skor tiap dimensi lewat **kartu radio 1–9** berpita warna (merah 1–3, kuning 4–6, hijau 7–9). Dimensi yang tidak diamati boleh **N/A**, kecuali dimensi wajib (DOPS: komunikasi, profesionalisme, penilaian global; Mini-CEX: komunikasi, profesionalisme). Mini-CEX juga meminta **penilaian global** kualitatif.
4. Tulis umpan balik naratif, lalu **Simpan Draf** (lanjutkan nanti) atau **Kirim Evaluasi** (mahasiswa diberi tahu; skor masuk radar, capaian, dan jurnal).

![Formulir Evaluasi DOPS Baru dengan kartu skor 1–9 berpita merah, kuning, dan hijau](panduan/5-4-form-dops.png)

Hanya penilai asal atau admin yang dapat menyunting/menghapus evaluasi.

### 5.5 Lembar Penguji (rubrik, CBD, Long Case)

**Asesmen & Evaluasi → Rubric-based Assessment** bagi pembimbing membuka **Lembar Penguji** (`/examiner_evaluations`): antrean percobaan yang **ditugaskan kepada Anda** (belum dinilai di atas) dan percobaan **belum bertugas** yang sudah dikumpulkan — siapa pun pembimbing boleh mengambilnya, kecuali percobaan milik akun sendiri. Kaprodi hanya dapat membuka dan mengambil percobaan mahasiswa prodi binaannya, kecuali bila ditunjuk sebagai penguji. Nilai ujian **hasil impor** (CBT, OSCE, dsb.) tidak dapat diubah dari Lembar Penguji — halaman itu hanya menampilkannya, dan tombol simpan diganti keterangan *hanya dapat disimpan oleh penguji yang ditugaskan atau admin*.

![Lembar Penguji: percobaan yang ditugaskan kepada Anda dan yang belum bertugas penguji](panduan/5-5-lembar-penguji.png)

Buka percobaan: baca dokumen/evaluasi diri mahasiswa (atau kasus klinis yang ditautkan untuk CBD/Long Case), lalu:

- bila event memakai **rubrik Assessment Form**, isi rubriknya di sini — nilai dihitung otomatis dari jawaban berbobot. Pertanyaan wajib harus dijawab, dan minimal satu pertanyaan bernilai (skala, skor, atau rubrik berjenjang) harus terisi. Mengisi ulang rubrik **menggantikan** lembar sebelumnya; bila isian ulang ditolak, lembar dan nilai lama tetap berlaku;
- bila tidak, ketik **nilai** (≤ nilai maksimum event);
- tulis umpan balik **Pertahankan** dan **Tingkatkan**, lalu simpan.

Mahasiswa menerima notifikasi; nilai tampil di Evaluasi Akademik, Jurnal Umpan Balik, dan kurva kohort.

### 5.6 Tugas Akhir: membimbing dan menguji

Semua pembimbing dapat melihat **seluruh** tugas akhir (`/final_projects`) karena siapa pun berpotensi menjadi penguji. Pembimbing yang ditunjuk mahasiswa dapat menyunting proyek dan milestone-nya. Untuk menguji, buka proyek → **Beri Skor**: tanggal sesi, skor 0–100, umpan balik (akun multi-peran tidak dapat menguji tugas akhirnya sendiri). Mahasiswa diberi tahu; rata-rata seluruh penguji tampil di proyek.

![Tugas akhir dilihat pembimbing, dengan tombol Beri Skor](panduan/5-6-tugas-akhir-pembimbing.png)

### 5.7 Memutuskan tingkat EPA

Buka **Peta EPA & Entrustment** lalu pilih mahasiswa (`/dashboard/entrustment?student_id=…`, atau dari tautan pada Dashboard Analitik / profil mahasiswa). Bila Anda **berelasi** dengan mahasiswa itu (tutor, preseptor rotasi, pembimbing TA, atau pernah memverifikasi kasus/menilai DOPS-Mini-CEX-nya), formulir keputusan tampil: pilih ranah, level 1–5, dan **justifikasi** (minimal 10 karakter). Kaprodi dapat membuka peta mahasiswa prodinya tetapi tidak memutuskan.

![Peta EPA mahasiswa dilihat pembimbing, dengan formulir Isi Penilaian terbuka](panduan/5-7-keputusan-epa.png)

### 5.8 Dashboard Analitik

**Coaching Center → Dashboard Analitik** (`/analitik`) adalah satu halaman dengan bagian yang tampil sesuai peran yang Anda miliki (bisa lebih dari satu sekaligus), dan **filter periode akademik** di kepala halaman yang menyaring ketiganya:

| Bagian | Untuk | Siapa yang tampil |
|---|---|---|
| **Mahasiswa Bimbingan** | dosen, admin | Mahasiswa yang tugas akhirnya Anda bimbing, pernah Anda nilai DOPS/Mini-CEX, atau tutee aktif Anda |
| **Mahasiswa di Wahana Anda** | preseptor, admin | Mahasiswa pada rotasi yang menunjuk Anda sebagai preseptor, dengan hitungan kegiatan & DOPS/Mini-CEX selama rentang rotasi |
| **Program Studi** | kaprodi, admin | Seluruh mahasiswa satu prodi (kaprodi terkunci ke prodinya; admin memilih prodi), plus **radar kohort** DOPS+Mini-CEX |

Tiap baris memuat jumlah kegiatan pada periode terpilih (kolom **Kegiatan Periode Ini**; bila belum ada periode akademik sama sekali, **Kegiatan Bulan Ini**), rata-rata DOPS, rata-rata Mini-CEX, rasio kasus terverifikasi, dengan **lencana warna** (hijau/kuning/merah) dan diurutkan **dari yang paling berisiko** (rata-rata terendah di atas; mahasiswa tanpa data diletakkan di akhir). Hanya evaluasi **Terkirim** yang dihitung.

![Dashboard Analitik dosen: bagian Mahasiswa Bimbingan dengan rata-rata DOPS, Mini-CEX, dan kasus terverifikasi](panduan/5-8-dashboard-analitik.png)

### 5.9 Daftar Mahasiswa

**Coaching Center → Daftar Mahasiswa** membuka halaman Pencarian (`/cari`) — cari nama/email, lalu klik kartu mahasiswa untuk membuka **Dasbor Mahasiswa** (hanya-baca) dan dari sana ke Evaluasi Akademik, Peta Kompetensi, Peta EPA, dsb. Kaprodi hanya menemukan dan membuka mahasiswa prodi binaannya; alamat `?student_id=` mahasiswa prodi lain ditolak dengan pesan *tidak memiliki akses*.

![Dasbor Mahasiswa (hanya-baca) dibuka dosen: rotasi berjalan, jumlah nilai, asesmen menunggu, kegiatan, kasus terverifikasi, dan pintasan ke halaman asesmen](panduan/5-9-dasbor-mahasiswa.png)

### 5.10 Khusus kaprodi

- **Relabel Prodi Mahasiswa** (`/admin/student_relabel/new`): unggah CSV `email,npm,angkatan` → pratinjau per baris → terapkan. Kaprodi dapat **Pindah** mahasiswa prodinya sendiri atau **Label ke prodi saya** (mengklaim mahasiswa dari prodi mana pun ke prodi Anda). Rincian format di [Relabel Prodi Mahasiswa](#relabel-prodi-mahasiswa).
- **Prodi binaan** akun Anda menentukan cakupan mahasiswa yang dapat Anda buka (Dasbor Mahasiswa dan halaman asesmennya), bagian *Program Studi* di Dashboard Analitik, mahasiswa yang boleh Anda pindahkan di Relabel, serta Jadwal DOPS & Mini-CEX, Learning Unit, dan isi berkas Ekspor Data yang Anda kelola. Prodi ini ditetapkan admin (**Konfigurasi → Pengguna → Sunting**) dan tidak dapat diubah dari Sunting Profil. Bila belum diisi, Relabel Prodi, Jadwal DOPS & Mini-CEX, Learning Unit, dan Ekspor Data menolak dengan pesan *akun kaprodi belum terhubung ke Program Studi*.
- **Coaching Center → Jadwal DOPS & Mini-CEX** (`/admin/evaluation_schedules`): hanya jadwal mahasiswa prodi Anda yang tampil; mahasiswa dan rotasi prodi lain ditolak saat menyimpan.
- **Coaching Center → Learning Unit & Matrix** (`/admin/learning_units`): hanya unit prodi Anda; prodi unit baru otomatis dikunci ke prodi Anda, dan komponen Assessment Matrix dipilih dari event prodi Anda atau event lintas prodi. Lihat [Bab 6](#bab-6--panduan-admin-konfigurasi).
- **Coaching Center → Ekspor Data (CSV)** (`/admin/exports`): unduh data mahasiswa prodi Anda — data mahasiswa, rekap capaian, logbook, kasus (tanpa draf dan tanpa identitas pasien), rotasi, tutorial, tugas akhir, DOPS/Mini-CEX, nilai event asesmen, keputusan EPA, jadwal, dan jawaban Assessment Form. Pilihan prodi terkunci ke prodi Anda; dataset Pengguna & Peran dan Master Data khusus admin. Lihat [Ekspor Data (CSV)](#ekspor-data-csv).
- Kaprodi **tidak** memverifikasi kasus/kegiatan, tidak menilai DOPS/Mini-CEX, dan tidak memutuskan tingkat EPA, sehingga menu Validasi tidak ditawarkan. Lembar Penguji tetap terbuka bila admin menunjuk Anda sebagai penguji suatu percobaan; percobaan tanpa penguji hanya dapat Anda ambil untuk mahasiswa prodi binaan.

![Dashboard Analitik kaprodi: bagian Program Studi dengan radar DOPS & Mini-CEX kohort, tabel mahasiswa prodi, dan tautan Ekspor CSV](panduan/5-10-analitik-kaprodi.png)

### 5.11 Monitoring SRQ

**Coaching Center → Monitoring SRQ** (`/monitoring-srq`) hanya untuk kaprodi yang sudah terhubung ke prodi binaan, dan selalu terkunci ke prodi itu.

**Mengaktifkan SRQ-20.** Menu **Kesehatan Mental (SRQ)** tidak tampil bagi mahasiswa sampai Anda mengaktifkannya untuk prodi Anda. Centang ketiga pernyataan kesiapan (SOP tindak lanjut, tinjauan rumusan dan ambang skor, kontak konselor), lalu klik **Aktifkan SRQ-20**. **Nonaktifkan** menutup pengisian baru, sedangkan riwayat tetap tersimpan dan tetap dapat dibuka pemiliknya.

Halaman ini memakai hasil **terakhir** tiap mahasiswa pada periode terpilih:

- **Ringkasan**: jumlah mahasiswa yang sudah mengisi, jumlah per kategori, dan yang belum ditindaklanjuti.
- **Perlu Perhatian**: mahasiswa dengan skor 6 atau lebih atau tanda perlu perhatian segera. Yang segera dan belum ditindaklanjuti tampil paling atas.
- **Per Angkatan**: partisipasi dan jumlah yang perlu perhatian.

![Monitoring SRQ: ringkasan partisipasi, daftar yang perlu perhatian beserta tindak lanjut, dan rekap per angkatan](panduan/5-11-monitoring-srq.png)

Tulis catatan lalu klik **Tandai Ditindaklanjuti** setelah Anda menghubungi atau merujuk mahasiswa. Catatan tersimpan terenkripsi. Hasil baru yang perlu perhatian memicu notifikasi bertuliskan umum tanpa nama, jadi buka halaman ini untuk melihat rinciannya.

Kaprodi tidak melihat jawaban per butir. SRQ-20 adalah penapisan, bukan diagnosis, sehingga hasilnya tidak boleh memengaruhi penilaian akademik.

---

## Bab 6 — Panduan Admin (Konfigurasi)

Urutan penyiapan instalasi baru yang disarankan: **Tahun/Periode Akademik → Program Studi → Pengguna → Kerangka Kompetensi → Target Kasus & Domain Kegiatan → Rotasi/Enrolment → Assessment Events**. Sisanya bisa menyusul. Langkah lengkapnya, termasuk pembagian tugas dan uji coba, ada di [Panduan Penyiapan](#panduan-penyiapan-untuk-kaprodi--admin-prodi).

### 6.1 Tahun/Periode Akademik

`/academic_periods` — nama, tanggal mulai, tanggal selesai. Periode dipakai oleh rotasi, enrolment tutorial, event asesmen, Learning Unit, target kasus, milestone kompetensi, dan filter Dashboard Analitik / Peta Kompetensi. Semester pada Logbook Kegiatan terisi otomatis hanya bila **tepat satu** periode mencakup tanggal kegiatan — hindari periode yang tumpang-tindih.

![Daftar Periode Akademik](panduan/6-1-periode-akademik.png)

Periode yang sudah dipakai rotasi klinik, enrolment tutorial, Assessment Event, target milestone kompetensi, Learning Unit, atau target kasus **tidak dapat dihapus**; pesan penolakan menyebut jumlah pemakaiannya (mis. *3 rotasi klinis dan 1 assessment event*). Rotasi dan data lain tidak ikut terhapus. Kegiatan logbook yang hanya mencantumkan semester itu tidak menghalangi — tautan semesternya saja yang dilepas. Periode yang keliru dibuat dan belum dipakai dapat dihapus seperti biasa.

### 6.2 Program Studi

`/study_programs` — nama, **kode** (huruf kecil, unik; bawaan `pssk` dan `pspd`), **jenjang** (sarjana/profesi). Kode prodi dipakai importer CSV pengguna dan paket migrasi. **Kerangka Peta EPA** menentukan kerangka yang dipakai Peta EPA mahasiswa prodi itu dan pilihan EPA saat verifikasi kasus; bila kosong, dipakai kerangka yang paling awal dibuat.

![Daftar Program Studi](panduan/6-2-program-studi.png)

### 6.3 Pengguna & impor CSV

`/admin/users` — daftar berpenyaring (nama/email, peran, prodi). **Sunting** mengubah nama, prodi, dan peran (minimal satu peran; peran aktif ikut disesuaikan bila dicabut) — untuk akun kaprodi, prodi di sini adalah **prodi binaan** yang membatasi hak aksesnya dan hanya dapat diubah admin; **Reset Kata Sandi** membuat kata sandi sementara acak (ditampilkan sekali — sampaikan langsung ke pengguna) sekaligus membuka kunci akun, dan pengguna wajib menggantinya saat masuk; **Konfirmasi Sekarang** mengaktifkan akun yang tersangkut konfirmasi email. Status **terkunci** (terlalu banyak salah kata sandi) tampil di halaman sunting.

**Pendaftaran mandiri** diatur di bagian atas halaman ini. Instalasi baru mulai tertutup, instalasi lama tetap terbuka sampai ditutup. Selama tertutup, tautan *Daftar* disembunyikan dan akun Google baru tidak dibuat.

**Status akun** ada di halaman Sunting. **Nonaktifkan Akun** mencegah pengguna masuk dan mengeluarkannya dari daftar pilihan serta hitungan prodi, tanpa menghapus rekam jejaknya; **Aktifkan Kembali** memulihkannya. **Hapus Akun** hanya tersedia untuk akun yang belum punya rekam jejak. Akun yang sedang Anda pakai tidak dapat dinonaktifkan atau dihapus.

![Daftar Pengguna dengan saringan nama/email, peran, dan prodi](panduan/6-3-pengguna.png)

**Impor CSV** (`/admin/users/import`) — header baris pertama, urutan kolom bebas, pemisah koma atau titik koma:

~~~csv
email,nama,peran,prodi
ani@kampus.ac.id,Ani Lestari,mahasiswa,pspd
budi@kampus.ac.id,Budi Santoso,dosen+preseptor,
~~~

- `peran`: kode dipisah `+` atau `;` (mahasiswa, dosen, preseptor, kaprodi, admin); kosong → mahasiswa.
- `prodi`: kode atau nama prodi; kosong → tidak diubah. Wajib bagi kaprodi yang bukan admin, karena itulah prodi binaannya; barisnya ditolak bila kosong.
- Akun baru: kata sandi sementara acak per akun, langsung terkonfirmasi, wajib diganti saat masuk pertama. Daftar email + kata sandi sementara ditampilkan **sekali** di halaman hasil impor (tombol **Unduh CSV**) — simpan sebelum meninggalkan halaman. Akun lama: hanya nama/peran/prodi yang diperbarui, kata sandi tidak disentuh. Setiap baris gagal dilaporkan dengan nomor barisnya.

Berkas CSV boleh disimpan sebagai *CSV UTF-8* maupun *CSV (dipisahkan koma)* bawaan Excel di Windows — nama beraksen seperti *José* atau *Behçet* tetap terbaca. Ketentuan ini berlaku untuk semua impor CSV: pengguna, master data, nilai Assessment Event, CBT & OSCE format Glide, dan relabel prodi.

![Halaman Impor Pengguna dari CSV dengan contoh format berkas](panduan/6-3-impor-pengguna.png)

### 6.4 Relabel Prodi Mahasiswa

`/admin/student_relabel/new` — memindahkan mahasiswa antar-prodi secara massal (mis. mahasiswa PSSK yang lanjut ke PSPD) sekaligus memperbarui NPM dan angkatan.

~~~csv
email,npm,angkatan
ani@kampus.ac.id,2301234567,2023
1901111111,2301234568,
~~~

- `email`: email akun **atau NPM lama**; `npm`: NPM baru (kosong = tetap); `angkatan`: kosong = angkatan bawaan formulir, atau tidak diubah.
- Alur **dua tahap**: **Pratinjau** menampilkan status tiap baris ("siap" atau alasan dilewati), lalu **Terapkan** menyimpan seluruh baris siap dalam **satu transaksi**.
- Baris dilewati (tidak menggagalkan batch) bila: akun tidak ditemukan, NPM lama cocok >1 akun, bukan peran Mahasiswa, muncul dua kali, angkatan tak terbaca, di luar prodi kaprodi, NPM baru dobel, atau tidak ada perubahan.
- Tidak ada mode "Tandai Lulus" — JEJAK Essential tidak mengelola status alumni.

![Relabel Prodi Mahasiswa dilihat kaprodi: aksi, prodi tujuan, angkatan default, dan berkas CSV](panduan/6-4-relabel-prodi.png)

### 6.5 Assessment Events dan impor nilai

`/admin/assessment_events` — satu event = satu ujian/penilaian pada satu **periode**, opsional dibatasi **prodi** dan **blok/stase** (dicocokkan dengan nama blok enrolment tutorial / nama stase rotasi mahasiswa). Isian: nama, **tipe** (14 tipe, lihat [4.8](#evaluasi-akademik-nilai-ujian)), tanggal ujian, **nilai maksimum**, **status** (Draf → Terbit → Ditutup; hanya Terbit yang tampil ke mahasiswa), batas waktu pengumpulan, **izinkan percobaan berulang**, dan untuk keluarga rubrik: **Assessment Form Template** sebagai rubrik terstruktur.

![Daftar Assessment Events](panduan/6-5-assessment-events.png)

Halaman event memuat:

- **Daftarkan mahasiswa** secara manual (dengan penguji dan jadwal opsional).
- **Hapus event** hanya untuk event yang belum punya nilai — event bernilai cukup diubah statusnya menjadi **Ditutup**. Percobaan yang belum dinilai, dimensi, dan komponen event itu pada Assessment Matrix Learning Unit ikut terhapus.
- **Dimensi** (mata uji CBT / station OSCE): nama, kode, bobot, nilai maks, dan **pemetaan ke ranah kompetensi** (tombol petakan massal). Event berdimensi menghitung nilai total dari rata-rata terbobot dimensi yang terisi; pemetaan inilah sumber "Capaian per ranah" di Peta Kompetensi.
- **Impor nilai** (ujian tulis/praktik):

<svg class="dg" viewBox="0 0 760 130" role="img" aria-label="Impor nilai CSV tiga langkah">
  <defs><marker id="ar-imp" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <rect x="10" y="20" width="160" height="70" rx="10" class="dg-box"/>
  <text x="90" y="44" class="dg-t dg-b" text-anchor="middle">0. Unduh templat</text>
  <text x="90" y="62" class="dg-ts" text-anchor="middle">berisi email mahasiswa prodi</text>
  <text x="90" y="76" class="dg-ts" text-anchor="middle">+ kolom nilai kosong</text>
  <rect x="205" y="20" width="160" height="70" rx="10" class="dg-box"/>
  <text x="285" y="44" class="dg-t dg-b" text-anchor="middle">1. Unggah CSV</text>
  <text x="285" y="62" class="dg-ts" text-anchor="middle">koma / titik koma, BOM</text>
  <text x="285" y="76" class="dg-ts" text-anchor="middle">&amp; desimal koma aman</text>
  <rect x="400" y="20" width="160" height="70" rx="10" class="dg-box-amber"/>
  <text x="480" y="44" class="dg-t dg-b" text-anchor="middle">2. Petakan kolom</text>
  <text x="480" y="62" class="dg-ts" text-anchor="middle">email, skor, nilai maks,</text>
  <text x="480" y="76" class="dg-ts" text-anchor="middle">percobaan, tanggal, dimensi</text>
  <rect x="595" y="20" width="155" height="70" rx="10" class="dg-box-green"/>
  <text x="672" y="44" class="dg-t dg-b" text-anchor="middle">3. Jalankan</text>
  <text x="672" y="62" class="dg-ts" text-anchor="middle">laporan: dibuat, diperbarui,</text>
  <text x="672" y="76" class="dg-ts" text-anchor="middle">email tak dikenal</text>
  <line x1="170" y1="55" x2="203" y2="55" class="dg-arrow" marker-end="url(#ar-imp)"/>
  <line x1="365" y1="55" x2="398" y2="55" class="dg-arrow" marker-end="url(#ar-imp)"/>
  <line x1="560" y1="55" x2="593" y2="55" class="dg-arrow" marker-end="url(#ar-imp)"/>
  <text x="380" y="118" class="dg-lbl" text-anchor="middle">Pemetaan ditebak otomatis dari nama header; email yang tidak dikenal dilaporkan, tidak dibuat akun baru.</text>
</svg>

Templat CSV dari tombol **Unduh templat** memuat kolom `email,nama_mahasiswa,npm,skor[,percobaan],tanggal[,<nama dimensi>…]` — kolom nama & NPM hanya penanda, baris yang nilainya dibiarkan kosong dilewati, dan `tanggal` (bawaan = tanggal ujian event) bisa diubah per baris untuk ujian susulan. Event tanpa percobaan berulang **menimpa** percobaan 1; event berulang menambah percobaan baru. Laporan impor menyebut jumlah nilai baru, diperbarui, nilai per dimensi, email tak dikenal, dan baris gagal; baris yang bernilai tetapi kolom emailnya kosong dilaporkan sebagai *(baris N tanpa email)*.

![Halaman event: Daftarkan mahasiswa, tab Dimensi & Pemetaan Kompetensi, dan tabel peserta & nilai](panduan/6-5-detail-event.png)

![Impor nilai CSV untuk satu Assessment Event](panduan/6-5-impor-nilai.png)

#### Impor CSV CBT & OSCE (format Glide)

**Konfigurasi → Impor CSV CBT & OSCE** (`/admin/glide_syncs`, padanan `/admin/glide_syncs/csv_import` jejak.pro) menerima **berkas .csv** hasil ekspor tabel Glide — tanpa koneksi API Glide. Berkas yang sama juga diterima jejak.pro, jadi data dapat dipindahkan bolak-balik. Tombol **+ Upload CSV** membuka formulir: pilih tipe data, unggah berkas (hingga 50 MB, pemisah koma/titik koma), lalu **Mulai Impor**. Tiap tipe punya tombol **Unduh templat CSV** berisi header persis ekspor Glide.

![Upload CSV Manual CBT & OSCE: pilihan tipe data, berkas, prodi & periode event baru, dan referensi kolom](panduan/6-5-impor-glide.png)

| Tipe | Berkas | Isi |
|---|---|---|
| **CBT Exam Results** | `data_cbt_exams_glide.csv` | ekspor hasil ujian per sesi: `Nomor Ujian`, `Nama Peserta`, `email`, `Tanggal` (mis. *9 September 2026*), `Sesi`, `Jumlah Benar`, `Jumlah Raw Nilai`, `Nilai Akhir` (skala 100), lalu **satu kolom per dimensi** berprefiks kelompok — `[AK]` Area Kompetensi, `[ST]` Sistem Organ, `[TK]`/`[TI]` Tingkat Kemampuan, `[KAT]` kategori soal. Format Glide lama (`email`, `exam_code`, `exam_title`, `exam_type`, `total_score`, `held_at`, kolom dimensi tanpa prefiks) tetap diterima |
| **OSCE** | `data_osce_glide.csv` | satu baris = satu station: `$rowID`, `emailYangDiuji`, `emailPenguji`, `tanggalEntry`, `station`, `kasus`, `IDSoal`, delapan dimensi klinis skala 0–3 (`Anamnesis`, `PemeriksaanFisik`, `InterpretasiData`, `PenegakanDiagnosis`, `TatalaksanaNonFarmakoterapi`, `TatalaksanaFarmakoterapi`, `KomunikasiDanEdukasiPasien`, `PerilakuProfesional`), `globalRating`, `halBaik`, `perluDitingkatkan`, `refleksi` |

Cara data masuk:

- **CBT** — satu `exam_code` = satu Assessment Event (dibuat otomatis bila belum ada; tipe *Progress Test* bila `exam_type` = progress_test, selain itu CBT Sumatif/Formatif). Periode akademik = periode yang memuat tanggal ujian. Setiap kolom selain kolom identitas & keterangan (`Nama Peserta`, `Sesi`, `Jumlah Benar`, …, serta kolom yang seluruh isinya teks) menjadi **dimensi** yang dikelompokkan ke kategori tinjauan — menurut prefiksnya (`[AK] Komunikasi efektif` → Area Kompetensi, nama dimensi "Komunikasi efektif"), atau ditebak dari namanya; kolom `[KAT]` dipilah ke Siklus Kehidupan, Setting Klinis, Aspek, Proses Klinis, Patomekanisme, dan sisanya **Kategori Soal**. Kolom yang bernilai **0 untuk semua peserta** dianggap kelompok tanpa soal di ujian itu dan tidak dijadikan dimensi (daftarnya tampil di ringkasan impor), supaya radar dan Peta Kompetensi tidak terisi nol palsu. Dimensi yang namanya sama persis dengan ranah kompetensi (mis. "Komunikasi efektif") langsung dipetakan. Opsi khusus CBT: **Judul ujian** dan **Tanggal ujian** menimpa isi berkas; berkas tanpa `exam_code` (termasuk ekspor per sesi) memakai kode dari judul (atau nama berkas) + tanggal — isi Judul ujian agar nama event rapi.
- **OSCE** — bawaan: **satu event per hari ujian** ("OSCE 20 Oktober 2025", tanggal entri dalam WIB), seperti rekap Sesi OSCE jejak.pro; atau pilih **Event tujuan** bila seluruh berkas adalah satu ujian. Delapan dimensi klinis dibuat sebagai dimensi event (maks 3). Nilai tiap mahasiswa = rata-rata nilai checklist station-nya; nilai per dimensi = rata-rata station yang menilainya. Halaman event mendapat tab **Station OSCE** berisi rincian per station, rata-rata dimensi, dan sebaran global rating.
- Opsi bersama: **Program studi** dan **Periode akademik** untuk event yang baru dibuat.

Aturan pengaman:

- **Idempoten** — OSCE berdasarkan `$rowID` (baris tanpa `$rowID`: mahasiswa + soal + penguji + hari), CBT berdasarkan mahasiswa + `exam_code`. Mengunggah ulang berkas yang sama tidak menggandakan nilai; nilai yang sudah ada **tidak ditimpa**.
- Email yang belum terdaftar sebagai **mahasiswa** dilewati (tidak dibuat akun). Nilai di luar skala, tanggal tak terbaca atau tak wajar (mis. tahun 2116), dan sel nilai bukan angka dilaporkan per baris.
- Mahasiswa yang sudah punya nilai OSCE dari sumber lain (input manual / impor generik) pada event tujuan tidak ditimpa station Glide.
- Setelah impor, halaman **ringkasan** menampilkan baris dibaca, nilai/station masuk, alasan dilewati, contoh galat, dan event yang terisi. **Rollback** di halaman itu menghapus semua yang dibuat unggahan tersebut (station, peserta, event baru yang kosong) dan mengembalikan peserta yang sebelumnya terdaftar ke status *Terdaftar*. Untuk mengoreksi nilai: rollback, perbaiki berkas, lalu unggah ulang.

![Ringkasan impor CBT: baris dibaca, nilai masuk, dilewati, galat, event yang terisi, dan tombol Rollback](panduan/6-5-hasil-impor-glide.png)

#### Kelola Ujian CBT

**Konfigurasi → Kelola Ujian CBT** (`/admin/cbt_exams`) mendaftar seluruh event CBT & Progress Test beserta kode ujian, tipe, jumlah peserta, tanggal, dan progres pemetaan dimensi. Klik **judul** atau **tanggal** untuk menyunting di tempat; mengoreksi tanggal ikut memindahkan tanggal nilai hasil impor sehingga grafik tren tetap benar. **Kelola Pemetaan** membuka tab Dimensi event untuk memetakan dimensi ke ranah kompetensi. Berbeda dari jejak.pro, ujian yang sudah bernilai **tidak dapat dihapus** dari sini — batalkan lewat rollback impor, atau ubah status event menjadi Ditutup.

![Kelola Ujian CBT](panduan/6-5-kelola-ujian-cbt.png)

### 6.6 Jadwal DOPS & Mini-CEX

`/admin/evaluation_schedules` (admin untuk semua prodi; kaprodi hanya mahasiswa prodi binaannya) — rencana penilaian: jenis (DOPS/Mini-CEX), mahasiswa, penilai, rotasi, waktu, status **Terjadwal / Selesai / Dibatalkan**. Jadwal tampil di beranda mahasiswa dan penilai; penilaian tetap dicatat lewat formulir DOPS/Mini-CEX, lalu tandai jadwalnya Selesai.

![Jadwal DOPS & Mini-CEX](panduan/6-6-jadwal-dops-minicex.png)

### 6.7 Kerangka Kompetensi

`/competency_frameworks` — pohon dua tingkat: **ranah/domain** (tingkat atas) dan **sub-kompetensi**. Bawaan: *Standar Kompetensi Dokter Indonesia (Ringkas)* dengan 7 area. Semua pengguna dapat melihatnya; hanya admin yang menambah/menghapus butir (form inline di halaman detail). Ranah tingkat atas berfungsi sebagai **EPA** di Peta EPA. Dari baris ranah, admin juga menetapkan **target milestone** (skor 1–9 per periode, lewat formulir **Set Target**) yang tampil di Peta Kompetensi mahasiswa.

![Kerangka Kompetensi: ranah dan sub-kompetensi, dengan formulir tambah butir dan Set Target](panduan/6-7-kerangka-kompetensi.png)

Aturan menghapus butir:

- Sub-kompetensinya ikut terhapus, begitu pula **tag kompetensi pada kegiatan**, **pemetaan blueprint**, dan **target milestone**-nya.
- **Pemetaan dimensi ujian dan pertanyaan rubrik dilepas** — dimensi dan pertanyaannya tetap ada, hanya tanpa ranah.
- Butir yang (atau yang sub-kompetensinya) sudah dipakai **keputusan EPA** mahasiswa **tidak dapat dihapus**, karena keputusan itu adalah nilai mahasiswa. Aturan yang sama berlaku saat menghapus seluruh kerangka.

### 6.8 Blueprint Asesmen

`/assessment_blueprints` — nama, deskripsi, daftar **capaian pembelajaran**, dan pemetaan **kompetensi → bobot** (ditambahkan satu per satu dari formulir di halaman detail, total bobot paling banyak 100% — mapping yang melebihi sisa bobot ditolak; selama total belum 100% halaman detail menampilkan *sisa X%*, dan nama/deskripsi blueprint tetap bisa disunting; radar chart bobot di halaman detail). Blueprint dapat dirujuk oleh Learning Unit; menghapus blueprint tidak menghapus Learning Unit yang merujuknya — rujukannya saja yang dilepas.

![Blueprint Asesmen: capaian pembelajaran, pemetaan kompetensi → bobot, dan radar bobot](panduan/6-8-blueprint-asesmen.png)

### 6.9 Learning Unit & Matrix

`/admin/learning_units` (admin untuk semua prodi; kaprodi hanya unit prodi binaannya) — blok/modul per prodi (opsional per periode, SKS, blueprint). **Assessment Matrix**: tambahkan komponen berupa Assessment Event beserta bobot; total bobot paling banyak 100% (komponen yang melebihi sisa bobot ditolak) dan total 100% ditandai hijau. Halaman unit menampilkan **rekap nilai per mahasiswa** — rata-rata terbobot dari komponen yang sudah dinilai (bobot tanpa nilai tidak menjadi penyebut).

![Daftar Learning Unit](panduan/6-9-learning-unit.png)

![Halaman Learning Unit: Assessment Matrix dengan bobot tiap event (total 100%) dan rekap nilai unit per mahasiswa](panduan/6-9-assessment-matrix.png)

### 6.10 Target Kasus Logbook

`/admin/logbook_case_targets` — target jumlah kasus **terverifikasi** per prodi × jenis fasilitas (**FKTP** = Pelayanan Primer, **FKRTL** = rumah sakit), opsional per periode. Target periode berjalan diutamakan atas target umum prodi. Tampil sebagai kartu Pemenuhan Target Kasus di halaman Kasus Klinis mahasiswa.

![Target Kasus Logbook per prodi dan jenis fasilitas](panduan/6-10-target-kasus.png)

### 6.11 Domain Kegiatan Akademik

`/admin/academic_activity_domains` — satu halaman pohon Domain → Subdomain/Kategori → Bentuk Kegiatan: tambah, sunting, geser urutan (▲▼), aktif/nonaktif, hapus, dengan jumlah pemakaian per simpul. Simpul yang sudah dipakai kegiatan **tidak bisa dihapus** — nonaktifkan saja: hilang dari formulir, kegiatan lama tetap utuh. Centang **Kegiatan klinis** pada domain yang harus dihitung Klinis di Portfolio. Isi bawaan (Praktek, Belajar Mengajar, Prestasi Kemahasiswaan, dll.) disalin saat instalasi hanya bila tabel masih kosong.

![Pohon Domain Kegiatan Akademik dengan jumlah pemakaian, tombol urutan ▲▼, Sunting, Nonaktifkan, dan Hapus](panduan/6-11-domain-kegiatan.png)

### 6.12 Master Diagnosis, Keterampilan, Obat

- **Master Diagnosis** (`/admin/diagnosis_definitions`): nama, kode ICD-10, level SKDI, sistem. Menjadi autocomplete diagnosis di wizard kasus dan sumber lencana ICD-10/SKDI. Bawaan 42 diagnosis.
- **Master Keterampilan** (`/admin/skill_definitions`): nama prosedur untuk autocomplete DOPS. Bawaan 25 keterampilan.
- **Master Obat** (`/admin/medication_definitions`): daftar obat untuk latihan resep di wizard kasus.

![Master Diagnosis: nama, kode ICD-10, level SKDI, sistem, dan kotak Impor CSV](panduan/6-12-master-diagnosis.png)

Ketiganya mendukung **impor CSV** (header alias ID/EN dikenali).

### 6.13 Assessment Form Builder (templat formulir)

`/assessment_form_templates` — hanya untuk **kaprodi dan admin** (keduanya mengelola penuh; pengguna lain ditolak dan tidak melihat menunya). Kaprodi/admin membuat templat: nama, deskripsi, **aktif**, **anonim**, **wajib pilih subjek** (orang yang dinilai). Tambahkan pertanyaan: label, jenis (Skala 1–5, Skor Angka 0–maks, Rubrik Berjenjang dengan deskriptor per tingkat, Pilihan Ganda, Ya/Tidak, Teks Singkat, Teks Panjang), wajib/opsional, **bobot**, dan **pemetaan ke ranah kompetensi**; urutan diatur dengan ▲▼. Jenis pertanyaan terkunci setelah ada jawaban. Templat dipakai dua cara: diisi langsung oleh kaprodi/admin lewat **Isi Formulir**, atau ditunjuk sebagai **rubrik** pada Assessment Event sehingga penguji mengisinya di Lembar Penguji (tetap terbuka bagi dosen/preseptor penguji) dan nilainya dihitung dari jawaban berbobot. Kaprodi dan admin melihat semua jawaban masuk di `/assessment_form_submissions`; pada templat **anonim**, identitas responden hanya terlihat oleh admin.

![Templat Evaluasi Dosen Tutor di Assessment Form Builder: daftar pertanyaan, bobot, dan jawaban masuk](panduan/6-13-form-builder.png)

### 6.14 Rotasi Klinik dan Enrolment Tutorial

Admin membuat **Rotasi Klinik** (`/clinical_rotations/new`: mahasiswa, periode, bagian/departemen, wahana, preseptor, tanggal) dan **Enrolment Tutorial** (`/tutorial_enrollments/new`: mahasiswa, periode, blok/sistem, tutor, tanggal; unik per mahasiswa-periode-blok; tombol aktif/selesai).

**Impor CSV** (`/clinical_rotations/import`, `/tutorial_enrollments/import`) menempatkan banyak mahasiswa sekaligus: unggah → pratinjau per baris → terapkan. Kolomnya `email,periode,bagian,wahana,mulai,selesai,preseptor` untuk rotasi dan `email,periode,blok,kelompok,mulai,selesai,tutor` untuk enrolment. `email` boleh diisi NPM/NIM, periode boleh dipilih di form, dan tanggal ditulis `2026-10-12` atau `12/10/2026`. Baris dengan mahasiswa, periode, dan bagian/blok yang sama memperbarui data lama, jadi berkas yang sama aman diunggah ulang; isian kosong tidak menghapus nilai lama.

 Nama stase/blok harus **sama persis** (tanpa membedakan huruf besar-kecil) dengan nama blok pada Assessment Event agar event tampil ke mahasiswa.

![Formulir Rotasi Klinik baru](panduan/6-14-rotasi-baru.png)

Rotasi yang sudah punya penilaian **DOPS/Mini-CEX tidak dapat dihapus** — nilai mahasiswa wajib bertaut ke rotasinya. Untuk rotasi yang belum dinilai, jadwal DOPS/Mini-CEX dan kegiatan logbook yang menunjuknya hanya dilepas tautannya saat rotasi dihapus.

### 6.15 Taksonomi Istilah

`/admin/terminology` — mengganti label menu sidebar, judul grup, bilah bawah ponsel, dan istilah halaman Logbook Kegiatan. Kotak **Cari label** menyaring daftar; kosongkan isian untuk kembali ke bawaan. Label menu hanya berlaku pada antarmuka Bahasa Indonesia; istilah halaman berlaku di kedua bahasa. Menu baru otomatis muncul di daftar ini.

![Taksonomi Istilah: label menu dan istilah halaman yang dapat diganti](panduan/6-15-taksonomi-istilah.png)

### 6.16 Data Governance

`/admin/data_governance` — sakelar **Contextual Privacy Mode** (bawaan menyala; bila server mengunci lewat variabel lingkungan `PRIVACY_MODE`, sakelar tidak dapat diubah dari sini) dan **Jejak Audit Break Glass**: 100 pembukaan identitas terakhir — siapa, kasus mana, kapan, alasan, alamat IP. Baris audit tidak pernah dihapus.

![Data Governance: sakelar Contextual Privacy Mode dan Jejak Audit Break Glass](panduan/6-16-data-governance.png)

### 6.17 Ekspor Data (CSV)

**Konfigurasi → Ekspor Data (CSV)** (`/admin/exports`; bagi kaprodi di **Coaching Center**) mengunduh data aplikasi sebagai berkas CSV untuk diolah di Excel, Google Sheets, atau aplikasi statistik — misalnya untuk laporan akreditasi, rapat evaluasi blok, atau arsip.

1. Atur **filter** di kepala halaman: **Program Studi** (admin: satu prodi atau *Semua prodi*; kaprodi: selalu prodi binaannya dan tidak dapat diganti), **Periode Akademik**, **Dari/Sampai tanggal**, dan **Format berkas**.
2. Tekan **Terapkan filter** untuk melihat jumlah baris tiap dataset sesuai filter (angka di pojok kartu).
3. Tekan **Unduh CSV** pada kartu dataset yang diinginkan.

![Halaman Ekspor Data (CSV): filter prodi, periode, tanggal, dan format, lalu kartu dataset dengan jumlah baris dan tombol Unduh CSV](panduan/6-17-ekspor-data.png)

Filter yang berlaku untuk tiap dataset ditandai label di kartunya (**Prodi**, **Periode**, **Tanggal**, **Formulir**); filter lain diabaikan. **Periode** menyaring data yang bertaut ke periode (rotasi, enrolment tutorial, event asesmen) atau — untuk data bertanggal — yang tanggalnya jatuh dalam rentang periode; **Dari/Sampai** menyempitkannya lagi. Rotasi dan enrolment ikut bila rentang penempatannya *bersinggungan* dengan Dari/Sampai. Prodi menyaring menurut prodi **mahasiswa**, bukan prodi event.

| Grup | Dataset | Satu baris = … | Untuk |
|---|---|---|---|
| Mahasiswa & Pengguna | Data Mahasiswa | satu mahasiswa: NPM, prodi, jenjang, angkatan, kontak, login terakhir | admin, kaprodi |
| | Rekap Capaian per Mahasiswa | satu mahasiswa: jumlah kegiatan (dan yang terverifikasi), kasus diajukan/terverifikasi, jumlah & rata-rata DOPS/Mini-CEX terkirim, rata-rata nilai event asesmen (percobaan tertinggi per event), jumlah ranah EPA berlevel, status tugas akhir | admin, kaprodi |
| | Pengguna & Peran | satu akun; empat kolom pertama (`email`, `nama`, `peran`, `prodi`) berformat [impor pengguna](#pengguna--impor-csv) sehingga dapat diimpor ulang | admin |
| Perjalanan Belajar | Logbook Kegiatan | satu kegiatan: taksonomi, waktu, lokasi, metode, status verifikasi | admin, kaprodi |
| | Kasus Klinis | satu kasus: diagnosis, ICD-10, SKDI, setting, status, verifier, tingkat entrustment | admin (termasuk draf), kaprodi (tanpa draf) |
| | Rotasi Klinik · Enrolment Tutorial | satu penempatan: stase/blok, wahana/kelompok, periode, preseptor/tutor | admin, kaprodi |
| | Tugas Akhir | satu tugas akhir: status, pembimbing, kemajuan milestone, rata-rata nilai penguji | admin, kaprodi |
| Asesmen & Kompetensi | DOPS · Mini-CEX | satu penilaian: penilai, stase, skor tiap dimensi, rata-rata, penilaian global (Mini-CEX), umpan balik | admin, kaprodi |
| | Nilai Event Asesmen | satu percobaan: event, tipe, nilai, persentase, penguji, sumber nilai, umpan balik | admin, kaprodi |
| | Keputusan Entrustment EPA | satu keputusan level EPA, termasuk yang tergantikan atau dicabut | admin, kaprodi |
| | Jadwal DOPS & Mini-CEX | satu jadwal penilaian | admin, kaprodi |
| | Jawaban Assessment Form | satu jawaban pertanyaan Form Builder (pilih formulir di kartunya) | admin, kaprodi |
| Master Data | Master Diagnosis · Keterampilan · Obat | satu butir; header sama dengan impor master data sehingga dapat disunting lalu diimpor ulang | admin |

Jawaban Assessment Form mengikuti akses Form Builder: kaprodi membaca jawaban semua formulir, tetapi pengisi formulir **anonim** tertulis *Anonim* — namanya hanya terbuka bagi admin.

**Format berkas**:

- *Standar (koma)* — untuk Google Sheets, LibreOffice, atau aplikasi statistik. Desimal memakai titik.
- *Excel Indonesia (titik koma)* — untuk Excel berpengaturan regional Indonesia, yang membuka CSV berkoma sebagai satu kolom. Desimal memakai koma, dan NPM/nomor telepon ditulis sebagai teks supaya nol di depan tidak hilang dan angka panjang tidak berubah menjadi `1,3E+11`.

Keduanya UTF-8 (nama beraksen tampil benar). Tanggal ditulis `TTTT-BB-HH`, waktu `TTTT-BB-HH JJ:MM`. Teks isian bebas yang diawali `=`, `+`, `-`, atau `@` diberi tanda `'` di depannya agar tidak dijalankan sebagai rumus spreadsheet.

**Yang tidak pernah ikut**: identitas pasien (nama, No. RM, tanggal lahir, telepon, alamat), refleksi pribadi mahasiswa (menu Refleksi dan kolom refleksi Logbook Kegiatan), kode pasien logbook, serta kata sandi/token akun.

**Riwayat Ekspor** di bagian bawah halaman mencatat setiap unduhan — waktu, pengguna, dataset, filter, dan jumlah baris. Admin melihat riwayat semua pengguna; kaprodi melihat riwayatnya sendiri. Berkas hasil ekspor berisi data pribadi mahasiswa: simpan di tempat aman dan jangan dibagikan di luar keperluan.

Dari **Dashboard Analitik** bagian *Program Studi*, tautan **Ekspor CSV** membuka halaman ini dengan prodi dan periode yang sedang dilihat.

---

## Bab 7 — Privasi & Keamanan Data Pasien

<svg class="dg" viewBox="0 0 760 210" role="img" aria-label="Alur perlindungan identitas pasien: enkripsi, penyamaran, Break Glass, audit">
  <defs><marker id="ar-priv" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="8" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <rect x="10" y="30" width="170" height="70" rx="10" class="dg-box"/>
  <text x="95" y="54" class="dg-t dg-b" text-anchor="middle">Disimpan terenkripsi</text>
  <text x="95" y="72" class="dg-ts" text-anchor="middle">nama, No. RM, tgl lahir,</text>
  <text x="95" y="86" class="dg-ts" text-anchor="middle">telepon, alamat</text>
  <rect x="215" y="30" width="170" height="70" rx="10" class="dg-box-gray"/>
  <text x="300" y="54" class="dg-t dg-b" text-anchor="middle">Tampil tersamar</text>
  <text x="300" y="72" class="dg-ts" text-anchor="middle">AF*** · RM-****56 · ••••</text>
  <text x="300" y="86" class="dg-ts" text-anchor="middle">untuk semua, termasuk pemilik</text>
  <rect x="420" y="30" width="170" height="70" rx="10" class="dg-box-amber"/>
  <text x="505" y="54" class="dg-t dg-b" text-anchor="middle">Break Glass</text>
  <text x="505" y="72" class="dg-ts" text-anchor="middle">alasan ≥ 10 karakter</text>
  <text x="505" y="86" class="dg-ts" text-anchor="middle">terbuka 30 menit, akun ini saja</text>
  <rect x="625" y="30" width="125" height="70" rx="10" class="dg-box-red"/>
  <text x="687" y="54" class="dg-t dg-b" text-anchor="middle">Audit permanen</text>
  <text x="687" y="72" class="dg-ts" text-anchor="middle">siapa, kapan, IP</text>
  <text x="687" y="86" class="dg-ts" text-anchor="middle">Data Governance</text>
  <line x1="180" y1="65" x2="213" y2="65" class="dg-arrow" marker-end="url(#ar-priv)"/>
  <line x1="385" y1="65" x2="418" y2="65" class="dg-arrow" marker-end="url(#ar-priv)"/>
  <line x1="590" y1="65" x2="623" y2="65" class="dg-arrow" marker-end="url(#ar-priv)"/>
  <rect x="215" y="130" width="375" height="56" rx="10" class="dg-box-green"/>
  <text x="402" y="152" class="dg-t dg-b" text-anchor="middle">Tidak sensitif — tampil terbuka</text>
  <text x="402" y="170" class="dg-ts" text-anchor="middle">usia, kelompok usia, jenis kelamin, pekerjaan, setting klinis, kompleksitas</text>
  <text x="380" y="204" class="dg-lbl" text-anchor="middle">Privacy Mode dapat dimatikan admin di Data Governance; bawaannya menyala (gagal ke arah aman).</text>
</svg>

Prinsip yang diterapkan aplikasi:

1. **Enkripsi di basis data** untuk nama, No. RM, tanggal lahir, telepon, dan alamat pasien, serta nama penanda tangan lembar persetujuan. Kunci enkripsi disimpan di server, terpisah dari data.
2. **Contextual Privacy Mode** menyamarkan identitas di layar untuk semua pembaca kecuali pembimbing kasus (pembimbing yang ditandai mahasiswa, preseptor rotasi pada tanggal kasus, dan dosen verifier kasus itu). Usia, jenis kelamin, pekerjaan, dan konteks klinis bukan data sensitif dan tampil terbuka.
3. **Break Glass** membuka identitas hanya untuk akun peminta, 30 menit, dengan alasan tertulis, dan **selalu tercatat**. Gunakan hanya untuk kebutuhan pelayanan/pembelajaran yang nyata.
4. **Persetujuan pasien** dikumpulkan lewat lembar QR tanpa login yang tidak menampilkan isi kasus.
5. **Kode pasien** pada Logbook Kegiatan adalah kode acak — bukan nama, bukan No. RM.
6. **Anonimitas formulir evaluasi**: pada templat anonim, subjek yang dinilai tidak melihat identitas pengisi.
7. **Kesehatan mental mahasiswa** (SRQ-20): jawaban dan catatan tindak lanjut terenkripsi, pengisian mensyaratkan persetujuan, kaprodi hanya melihat skor dan kategori, serta datanya tidak ikut Ekspor Data maupun paket migrasi.
8. **Data yang keluar aplikasi** (ekspor CSV Portfolio, [Ekspor Data (CSV)](#ekspor-data-csv), feed iCal, paket migrasi) **tidak memuat identitas pasien**; setiap unduhan Ekspor Data tercatat di Riwayat Ekspor; paket migrasi hanya membawanya bila admin server secara eksplisit memintanya.
9. **Lampiran** (bukti kasus dan kegiatan, dokumen asesmen, foto profil) hanya dapat diunduh setelah masuk, oleh akun yang berhak membuka kasus, kegiatan, atau asesmennya. Tautan yang tersalin tidak berlaku bagi orang lain.

Kewajiban pengguna: jangan menulis nama atau nomor identitas pasien pada kolom bebas (keluhan, anamnesis, catatan, judul kegiatan, refleksi) — kolom itu **tidak** terenkripsi dan tidak disamarkan.

---

## Bab 8 — Notifikasi

| Peristiwa | Penerima |
|---|---|
| Kasus dikirim untuk verifikasi | dosen/preseptor pembimbing yang ditandai |
| Kasus diverifikasi / perlu revisi / ditolak / verifikasi dibatalkan | pemilik kasus |
| Komentar baru pada kasus | pemilik atau verifier — sebelum ada verifier, pembimbing yang ditandai (lawan bicara) |
| Kegiatan diverifikasi | pemilik kegiatan |
| Permintaan DOPS / Mini-CEX / CBD / Long Case dari kasus | penilai yang ditunjuk |
| DOPS / Mini-CEX terkirim | mahasiswa |
| Pengumpulan asesmen rubrik | penguji yang ditunjuk |
| Nilai asesmen keluar | mahasiswa |
| Tingkat entrustment diperbarui | mahasiswa |
| Skor ujian tugas akhir | mahasiswa |
| Jadwal DOPS / Mini-CEX dibuat | mahasiswa dan penilai |
| Hasil SRQ perlu ditinjau (tanpa nama) | kaprodi prodi mahasiswa |

Semua notifikasi muncul di lonceng topbar dan halaman **Notifikasi**. **Web Push** ke perangkat (peramban desktop/Android; iPhone lewat aplikasi di Layar Utama) aktif bila server dipasangi kunci VAPID — tombol **Aktifkan Notifikasi Push** di halaman Notifikasi. Notifikasi push dapat dimatikan dari halaman yang sama.

---

## Bab 9 — Bagaimana Data Mengalir ke Capaian

<svg class="dg" viewBox="0 0 760 330" role="img" aria-label="Peta aliran data dari pencatatan ke capaian">
  <defs><marker id="ar-flow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse"><path d="M0,0 L10,5 L0,10 z" class="dg-arrowhead"/></marker></defs>
  <text x="120" y="22" class="dg-lbl dg-b" text-anchor="middle">SUMBER (dicatat)</text>
  <text x="380" y="22" class="dg-lbl dg-b" text-anchor="middle">DIPUTUSKAN OLEH</text>
  <text x="640" y="22" class="dg-lbl dg-b" text-anchor="middle">TAMPIL SEBAGAI</text>
  <rect x="20" y="36" width="200" height="40" rx="8" class="dg-box"/><text x="120" y="60" class="dg-t" text-anchor="middle">Kasus Klinis</text>
  <rect x="20" y="86" width="200" height="40" rx="8" class="dg-box"/><text x="120" y="110" class="dg-t" text-anchor="middle">Logbook Kegiatan</text>
  <rect x="20" y="136" width="200" height="40" rx="8" class="dg-box"/><text x="120" y="160" class="dg-t" text-anchor="middle">DOPS / Mini-CEX</text>
  <rect x="20" y="186" width="200" height="40" rx="8" class="dg-box"/><text x="120" y="210" class="dg-t" text-anchor="middle">Assessment Event (CBT/OSCE…)</text>
  <rect x="20" y="236" width="200" height="40" rx="8" class="dg-box"/><text x="120" y="260" class="dg-t" text-anchor="middle">Rubrik / CBD / Long Case</text>
  <rect x="20" y="286" width="200" height="40" rx="8" class="dg-box"/><text x="120" y="310" class="dg-t" text-anchor="middle">Tugas Akhir</text>
  <rect x="290" y="36" width="180" height="40" rx="8" class="dg-box-amber"/><text x="380" y="60" class="dg-t" text-anchor="middle">Verifikasi pembimbing</text>
  <rect x="290" y="136" width="180" height="40" rx="8" class="dg-box-amber"/><text x="380" y="160" class="dg-t" text-anchor="middle">Penilai (skala 1–9)</text>
  <rect x="290" y="186" width="180" height="40" rx="8" class="dg-box-amber"/><text x="380" y="210" class="dg-t" text-anchor="middle">Impor CSV admin</text>
  <rect x="290" y="236" width="180" height="40" rx="8" class="dg-box-amber"/><text x="380" y="260" class="dg-t" text-anchor="middle">Lembar Penguji</text>
  <rect x="290" y="286" width="180" height="40" rx="8" class="dg-box-amber"/><text x="380" y="310" class="dg-t" text-anchor="middle">Skor penguji</text>
  <rect x="540" y="36" width="200" height="40" rx="8" class="dg-box-green"/><text x="640" y="60" class="dg-t" text-anchor="middle">Peta EPA &amp; target kasus</text>
  <rect x="540" y="86" width="200" height="40" rx="8" class="dg-box-green"/><text x="640" y="110" class="dg-t" text-anchor="middle">Portfolio &amp; Kalender</text>
  <rect x="540" y="136" width="200" height="40" rx="8" class="dg-box-green"/><text x="640" y="160" class="dg-t" text-anchor="middle">Radar kompetensi</text>
  <rect x="540" y="186" width="200" height="40" rx="8" class="dg-box-green"/><text x="640" y="210" class="dg-t" text-anchor="middle">Nilai unit &amp; persentil kohort</text>
  <rect x="540" y="236" width="200" height="40" rx="8" class="dg-box-green"/><text x="640" y="260" class="dg-t" text-anchor="middle">Jurnal Umpan Balik</text>
  <rect x="540" y="286" width="200" height="40" rx="8" class="dg-box-green"/><text x="640" y="310" class="dg-t" text-anchor="middle">Dashboard Analitik</text>
  <line x1="220" y1="56" x2="288" y2="56" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="470" y1="56" x2="538" y2="56" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="220" y1="106" x2="538" y2="106" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="220" y1="156" x2="288" y2="156" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="470" y1="156" x2="538" y2="156" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="220" y1="206" x2="288" y2="206" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="470" y1="206" x2="538" y2="206" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="220" y1="256" x2="288" y2="256" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="470" y1="256" x2="538" y2="256" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="220" y1="306" x2="288" y2="306" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <line x1="470" y1="306" x2="538" y2="306" class="dg-arrow" marker-end="url(#ar-flow)"/>
  <path d="M470,166 L505,166 L505,300 L538,300" fill="none" class="dg-arrow dg-dash" marker-end="url(#ar-flow)"/>
  <path d="M470,216 L520,216 L520,250 L538,250" fill="none" class="dg-arrow dg-dash" marker-end="url(#ar-flow)"/>
</svg>

Beberapa konsekuensi praktis:

- Kasus **belum diverifikasi** tidak dihitung ke target kasus dan tidak menulis Peta EPA.
- DOPS/Mini-CEX **draf** tidak masuk radar, capaian, jurnal, maupun Dashboard Analitik.
- Nilai ujian tampil di Peta Kompetensi **hanya pada periode event-nya**; capaian per ranah butuh dimensi yang dipetakan admin.
- Nilai Learning Unit adalah "capaian dari komponen yang sudah dinilai" — bukan nilai akhir sebelum semua komponen masuk.

---

## Bab 10 — Pertanyaan yang Sering Diajukan

**Saya mendaftar tetapi tidak bisa masuk: "harus mengonfirmasi email".**
Server tidak mengirim surel. Minta admin membuka **Konfigurasi → Pengguna → Sunting → Konfirmasi Sekarang**.

**Menu Konfigurasi / Coaching Center tidak muncul.**
Sidebar mengikuti **peran aktif**. Ganti peran di topbar. Konfigurasi hanya untuk akun berperan admin.

**Event asesmen tidak tampil di Rubric-based Assessment / Asesmen Saya.**
Periksa: (1) event berstatus **Terbit**; (2) **Program Studi** di profil Anda sama dengan prodi event; (3) bila event dibatasi blok/stase, nama blok pada **enrolment tutorial aktif** atau **rotasi berjalan** Anda harus sama dengan nama blok event; (4) batas waktu pengumpulan belum lewat. Event ujian tulis/praktik memang tidak tampil di sini — nilainya diimpor admin dan muncul di **Evaluasi Akademik**.

**Tombol Minta DOPS / Mini-CEX menolak: "Tidak ada rotasi klinis yang mencakup tanggal kasus".**
Permintaan dari kasus membutuhkan **rotasi klinik** Anda yang mencakup tanggal kasus (atau sedang berjalan) dan rotasi itu harus punya **preseptor**. Minta admin melengkapi jadwal rotasi.

**Semester di formulir kegiatan tidak terisi otomatis.**
Terisi hanya bila tepat satu periode akademik mencakup tanggal kegiatan. Pilih manual bila periode tumpang-tindih atau belum dibuat admin.

**Identitas pasien tampak `AF***` padahal saya pemiliknya.**
Itu Privacy Mode — berlaku untuk semua, termasuk pemilik kasus; hanya pembimbing kasus yang melihatnya langsung. Gunakan **Break Glass** bila perlu, dengan alasan yang benar; pembukaan tercatat.

**Kegiatan lama saya tampil "Klinis/Non-Klinis" tanpa domain.**
Kegiatan yang dicatat sebelum taksonomi ada tidak ditebak domainnya. Sunting kegiatan dan pilih domain — hanya jika Anda ingin.

**Kartu Pemenuhan Target Kasus tidak muncul.**
Admin belum menetapkan target untuk prodi Anda, atau Program Studi Anda kosong. Hanya kasus **terverifikasi** yang dihitung.

**Posisi terhadap kohort tidak tampil.**
Kohort untuk tipe asesmen & periode itu kurang dari 3 mahasiswa, atau Anda belum punya nilai dinilai pada periode tersebut.

**Saya dosen sekaligus mahasiswa; kenapa tidak bisa memverifikasi kasus saya sendiri?**
Disengaja — verifikasi harus dilakukan orang lain. Hal yang sama berlaku untuk menilai DOPS/Mini-CEX, percobaan asesmen, dan tugas akhir milik sendiri.

**Kaprodi: menu Validasi Kasus/Kegiatan tidak ada, dan mahasiswa prodi lain tidak bisa saya buka.**
Disengaja — kaprodi memantau prodi binaannya tanpa memverifikasi atau menilai. Bila Anda juga bertugas sebagai dosen/preseptor, minta admin menambahkan peran itu lalu pilih sebagai peran aktif.

**Kegiatan saya kembali berstatus belum diverifikasi setelah saya sunting.**
Disengaja — verifikasi mengesahkan isi saat itu, jadi perubahan isi, waktu, bukti, atau kompetensi perlu diperiksa ulang. Mengubah kolom refleksi saja tidak membatalkan verifikasi.

**Tautan lampiran yang saya salin tidak bisa dibuka orang lain.**
Disengaja — lampiran hanya dapat diunduh setelah masuk, oleh akun yang berhak membuka kasus, kegiatan, atau asesmennya.

**Siapa yang bisa melihat hasil SRQ saya?**
Kaprodi prodi Anda melihat skor dan kategori, dengan persetujuan yang Anda berikan saat mengisi. Jawaban per butir hanya terlihat oleh Anda, dan pengguna lain, termasuk dosen dan admin, tidak melihat hasil Anda.

**Bagaimana menghapus akun?**
Halaman **Pengaturan Akun** sengaja tidak menyediakan tombol hapus akun: logbook, kasus, dan nilai Anda adalah rekam jejak pendidikan yang dikelola program studi. Hubungi admin program studi.

**Kaprodi: Program Studi Binaan tidak bisa saya ubah di Sunting Profil.**
Disengaja — prodi itu membatasi data yang boleh Anda lihat dan ubah. Minta admin mengubahnya di **Konfigurasi → Pengguna → Sunting**.

**Admin: periode, rotasi, event, atau butir kompetensi menolak dihapus.**
Data itu sudah dipakai — oleh rotasi/event/milestone (periode), penilaian DOPS/Mini-CEX (rotasi), nilai mahasiswa (event), atau keputusan EPA mahasiswa (butir kompetensi). Pesan penolakan menyebut pemakaiannya. Data yang sudah dipakai sebaiknya dibiarkan; untuk event, ubah statusnya menjadi **Ditutup**.

---

## Bab 11 — Pindah ke jejak.pro

Seluruh data JEJAK Essential dapat dipindahkan ke jejak.pro tanpa ketik ulang. Admin server menjalankan `bin/rails migration:check` (memeriksa kesiapan data) lalu `bin/rails migration:export` untuk membuat paket berisi salinan lengkap tabel, berkas CSV berformat kontrak jejak.pro, dan lampiran; identitas pasien hanya ikut bila diminta secara eksplisit. Paket itu kemudian diimpor di jejak.pro dengan uji coba terlebih dahulu. Rincian teknis ada pada dokumen `MIGRASI_KE_JEJAK_PRO.md` di paket instalasi.

---

## Lampiran A — Daftar Alamat Halaman

| Menu | Alamat |
|---|---|
| Beranda | `/dashboard` |
| Longitudinal Portfolio | `/portfolio` (ekspor: `/portfolio/export`) |
| Profil Saya / Sunting | `/profile`, `/profile/edit` |
| Pengaturan Saya / Pengaturan Akun | `/pengaturan`, `/users/edit` |
| Notifikasi | `/notifications` |
| Kasus Klinis / Validasi Kasus / Riwayat Verifikasi | `/clinical_cases`, `/clinical_cases?scope=to_verify`, `/clinical_cases?scope=reviewed` |
| Logbook Kegiatan / Validasi Kegiatan / Kalender | `/activity_logs`, `/activity_logs?scope=to_verify`, `/kalender` |
| Rotasi Klinik / Impor CSV | `/clinical_rotations`, `/clinical_rotations/import` |
| Enrolment Tutorial / Impor CSV | `/tutorial_enrollments`, `/tutorial_enrollments/import` |
| Refleksi | `/reflection_entries` |
| Kesehatan Mental (SRQ) / Monitoring SRQ | `/kesehatan-mental`, `/monitoring-srq` |
| Tugas Akhir | `/final_projects` |
| Evaluasi Akademik | `/nilai-ujian` |
| Workplace Assessment (DOPS/Mini-CEX) | `/asesmen`, `/dops_evaluations/new`, `/mini_cex_evaluations/new` |
| Rubric-based Assessment (mahasiswa) | `/student/assessments` |
| Lembar Penguji (pembimbing) | `/examiner_evaluations` |
| Jurnal Umpan Balik | `/student/feedback_journal` |
| Assessment Form Builder / jawaban | `/assessment_form_templates`, `/assessment_form_submissions` |
| Peta Kompetensi | `/capaian-belajar` |
| Peta EPA & Entrustment | `/dashboard/entrustment` |
| Dashboard Analitik | `/analitik` |
| Daftar Mahasiswa / Pencarian | `/cari` |
| Tahun/Periode Akademik | `/academic_periods` |
| Program Studi | `/study_programs` |
| Pengguna / Impor CSV | `/admin/users`, `/admin/users/import` |
| Relabel Prodi Mahasiswa | `/admin/student_relabel/new` |
| Assessment Events | `/admin/assessment_events` |
| Jadwal DOPS & Mini-CEX | `/admin/evaluation_schedules` |
| Kerangka Kompetensi | `/competency_frameworks` |
| Blueprint Asesmen | `/assessment_blueprints` |
| Learning Unit & Matrix | `/admin/learning_units` |
| Target Kasus Logbook | `/admin/logbook_case_targets` |
| Domain Kegiatan Akademik | `/admin/academic_activity_domains` |
| Master Diagnosis / Keterampilan / Obat | `/admin/diagnosis_definitions`, `/admin/skill_definitions`, `/admin/medication_definitions` |
| Taksonomi Istilah | `/admin/terminology` |
| Data Governance | `/admin/data_governance` |
| Ekspor Data (CSV) | `/admin/exports` (unduhan: `/admin/exports/<dataset>.csv`) |
| Lembar persetujuan pasien (publik) | `/persetujuan/<token>` |
| Panduan ini | `/panduan` |

## Lampiran B — Glosarium

| Istilah | Arti |
|---|---|
| **Break Glass** | Pembukaan identitas pasien yang tersamar, beralasan, 30 menit, dan selalu diaudit. |
| **CBD / Long Case** | Asesmen berbasis kasus (Case-Based Discussion / Long Case) yang diinisiasi dari Kasus Klinis. |
| **DOPS** | Direct Observation of Procedural Skills — penilaian langsung satu prosedur, 10 dimensi skala 1–9. |
| **Mini-CEX** | Mini Clinical Evaluation Exercise — penilaian satu pertemuan pasien, 6 dimensi + penilaian global. |
| **EPA / Entrustment** | Entrustable Professional Activity — tingkat kepercayaan 1–5 per ranah kompetensi. |
| **FKTP / FKRTL** | Fasilitas Kesehatan Tingkat Pertama (pelayanan primer) / Rujukan Tingkat Lanjut (rumah sakit). |
| **Assessment Event** | Satu ujian/penilaian pada satu periode; wadah semua nilai. |
| **Percobaan (attempt)** | Satu kali keikutsertaan mahasiswa pada sebuah event; nilai tertinggi menjadi wakil. |
| **Learning Unit** | Blok/modul yang nilainya disusun dari beberapa event lewat Assessment Matrix berbobot. |
| **Kohort** | Seluruh mahasiswa (gabungan sarjana + profesi) dengan nilai pada tipe asesmen & periode yang sama. |
| **SRQ-20** | Self Reporting Questionnaire: skrining mandiri 20 pertanyaan ya/tidak dari WHO; skor 6 atau lebih menandakan perlu tindak lanjut. |
| **Privacy Mode** | Penyamaran identitas pasien di layar untuk semua pembaca selain pembimbing kasus. |
| **Rotasi Klinik / Stase** | Penempatan mahasiswa profesi di satu bagian & wahana pada rentang tanggal. |
| **Enrolment Tutorial** | Penempatan mahasiswa sarjana pada blok/sistem dengan dosen tutor. |
| **Taksonomi Istilah** | Penggantian label menu/istilah oleh admin tanpa mengubah kode. |
