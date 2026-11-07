require "test_helper"

class ActivityLogsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup { sign_in users(:budi) }

  def verified_log(**attrs)
    log = users(:budi).activity_logs.create!(title: "Jaga malam", activity_date: Date.new(2026, 10, 1), category: "klinis",
                                             started_at: Time.zone.local(2026, 10, 1, 8, 0), delivery_mode: "luring",
                                             academic_activity_domain: academic_activity_domains(:praktek), **attrs)
    log.verify!(by: users(:wati))
    log
  end

  def form_params(log, **changes)
    { title: log.title, academic_activity_domain_id: log.academic_activity_domain_id, delivery_mode: log.delivery_mode,
      started_at: log.started_at&.strftime("%Y-%m-%dT%H:%M") || "2026-10-01T08:00" }.merge(changes)
  end

  test "mengubah isi kegiatan terverifikasi mengembalikannya ke antrean verifikasi" do
    log = verified_log
    patch activity_log_path(log), params: { activity_log: form_params(log, title: "Isi diubah") }

    log.reload
    assert_equal "Isi diubah", log.title
    assert_not log.verified?
    assert_nil log.verified_by
    assert_match "diverifikasi ulang", flash[:notice]
    assert_includes ActivityLog.awaiting_verification_by(users(:wati)), log
  end

  test "mengubah waktu kegiatan terverifikasi meminta verifikasi ulang" do
    log = verified_log
    patch activity_log_path(log), params: { activity_log: form_params(log, started_at: "2026-10-01T20:00") }
    assert_not log.reload.verified?
  end

  test "menyimpan tanpa perubahan atau mengubah refleksi saja mempertahankan verifikasi" do
    log = verified_log
    log.update_column(:started_at, Time.zone.local(2026, 10, 1, 8, 0, 37)) # detik tidak terkirim dari form

    patch activity_log_path(log), params: { activity_log: form_params(log) }
    assert log.reload.verified?

    patch activity_log_path(log), params: { activity_log: form_params(log, reflection: "Pelajaran dari jaga malam") }
    log.reload
    assert_equal "Pelajaran dari jaga malam", log.reflection
    assert log.verified?
    assert_equal users(:wati), log.verified_by
  end

  test "kegiatan lama tanpa jam tetap terverifikasi saat jam isian awal terkirim" do
    log = verified_log
    log.update_column(:started_at, nil)

    patch activity_log_path(log), params: { activity_log: form_params(log, started_at: "2026-10-01T08:00") }
    assert log.reload.verified?
  end

  test "menambah bukti atau mengubah kompetensi meminta verifikasi ulang" do
    log = verified_log
    upload = Rack::Test::UploadedFile.new(StringIO.new("%PDF-1.4 bukti"), "application/pdf", original_filename: "baru.pdf")
    patch activity_log_path(log), params: { activity_log: form_params(log, evidence_files: [ "", upload ]) }
    assert_not log.reload.verified?

    tagged = verified_log
    patch activity_log_path(tagged), params: { activity_log: form_params(tagged, competency_item_ids: [ "", CompetencyItem.first.id ]) }
    assert_not tagged.reload.verified?
  end

  test "membuat kode pasien tidak membatalkan verifikasi" do
    log = verified_log
    post generate_patient_code_activity_log_path(log)
    assert log.reload.patient_code.present?
    assert log.verified?
  end

  test "kegiatan terverifikasi tidak bisa dihapus dan tombolnya tidak ditawarkan" do
    log = verified_log
    get activity_log_path(log)
    assert_select "form[action=?][method=post] input[name=_method][value=delete]", activity_log_path(log), 0

    delete activity_log_path(log)
    assert ActivityLog.exists?(log.id)
  end

  test "form sunting kegiatan terverifikasi memberi peringatan" do
    get edit_activity_log_path(verified_log)
    assert_match "antrean verifikasi", response.body
  end

  test "menolak akses tanpa login" do
    sign_out users(:budi)
    get activity_logs_path
    assert_redirected_to new_user_session_path
  end

  test "index hanya menampilkan kegiatan milik pengguna sendiri" do
    get activity_logs_path

    assert_response :success
    assert_match activity_logs(:jaga_igd).title, response.body
    assert_no_match activity_logs(:kegiatan_siti).title, response.body
  end

  test "filter domain hanya menampilkan kegiatan domain itu, chip hanya untuk domain yang dipakai" do
    sign_in users(:siti)
    belajar = academic_activity_domains(:belajar_mengajar)
    get activity_logs_path(domain_id: belajar.id)

    assert_response :success
    assert_match activity_logs(:tutorial_siti).title, response.body
    assert_no_match activity_logs(:kegiatan_siti).title, response.body
    assert_select "a[href*='domain_id=#{belajar.id}']", text: /Belajar Mengajar/
    assert_select "a[href*='domain_id=#{academic_activity_domains(:prestasi).id}']", count: 0
  end

  test "kegiatan lama tanpa domain tetap tampil dengan label Klinis/Non-Klinis dan teks jenisnya" do
    get activity_logs_path

    assert_match "Klinis", response.body
    assert_match activity_logs(:jaga_igd).activity_type, response.body
  end

  test "form baru: domain aktif, subdomain & bentuk kegiatan bertingkat" do
    get new_activity_log_path

    assert_response :success
    form = css_select("form[data-controller='activity-taxonomy']").first
    assert form, "form bertaksonomi tidak dirender"
    subdomains = JSON.parse(form["data-activity-taxonomy-subdomains-value"])
    templates = JSON.parse(form["data-activity-taxonomy-templates-value"])
    belajar_options = subdomains[academic_activity_domains(:belajar_mengajar).id.to_s]
    assert_includes belajar_options, { "id" => academic_activity_subdomains(:tutorial).id, "name" => "Tutorial" }
    assert belajar_options.none? { |option| option["name"] == "Metode Lama" }, "subdomain nonaktif ikut ditawarkan"
    assert_equal [ "Juara-1 Perorangan", "Juara-2 Perorangan" ],
                 templates[academic_activity_subdomains(:kompetisi).id.to_s].map { |option| option["name"] }

    assert_select "select[name='activity_log[academic_activity_domain_id]'] option", text: "Praktek"
    assert_select "select[name='activity_log[academic_activity_domain_id]'] option", text: "Domain Arsip", count: 0
    assert_select "[data-activity-taxonomy-target='subdomainField'][hidden]"
    assert_select "[data-activity-taxonomy-target='templateField'][hidden]"
    %w[title location started_at ended_at academic_period_id evidence_url document_url].each do |field|
      assert_select "[name='activity_log[#{field}]']"
    end
    assert_select "input[type=radio][name='activity_log[delivery_mode]']", count: 2
  end

  test "mencatat kegiatan baru dengan domain, subdomain, dan waktu" do
    assert_difference "ActivityLog.count", 1 do
      post activity_logs_path, params: { activity_log: valid_params(
        academic_activity_domain_id: academic_activity_domains(:praktek).id,
        academic_activity_subdomain_id: academic_activity_subdomains(:jaga_ugd).id,
        started_at: "2026-09-10T08:30", ended_at: "2026-09-10T14:00",
        evidence_url: "https://drive.example.com/bukti"
      ) }
    end

    log = ActivityLog.order(:id).last
    assert_redirected_to activity_log_path(log)
    assert_equal users(:budi), log.user
    assert_equal academic_activity_subdomains(:jaga_ugd), log.academic_activity_subdomain
    assert_equal "klinis", log.category, "domain klinis menurunkan kategori klinis"
    assert_equal Time.zone.local(2026, 9, 10, 8, 30), log.started_at
    assert_equal Date.new(2026, 9, 10), log.activity_date

    follow_redirect!
    assert_match "Jaga UGD", response.body
    assert_match "08:30–14:00", response.body
    assert_select "a[href='https://drive.example.com/bukti'][rel~=noopener]"
  end

  test "bentuk kegiatan cukup untuk menurunkan subdomain dan domain" do
    post activity_logs_path, params: { activity_log: valid_params(
      academic_activity_domain_id: academic_activity_domains(:prestasi).id,
      academic_activity_template_id: academic_activity_templates(:juara_1).id
    ) }

    log = ActivityLog.order(:id).last
    assert_equal academic_activity_subdomains(:kompetisi), log.academic_activity_subdomain
    assert_equal "non_klinis", log.category
    assert_equal "Juara-1 Perorangan", log.kind_label
  end

  test "domain, waktu mulai, dan metode wajib diisi di form" do
    assert_no_difference "ActivityLog.count" do
      post activity_logs_path, params: { activity_log: { title: "Tanpa domain" } }
    end

    assert_response :unprocessable_entity
    assert_match "Domain kegiatan wajib dipilih", response.body
    assert_match "Waktu mulai wajib diisi", response.body
    assert_match "Metode pelaksanaan wajib dipilih", response.body
  end

  test "subdomain dari domain lain dan domain nonaktif ditolak" do
    post activity_logs_path, params: { activity_log: valid_params(
      academic_activity_domain_id: academic_activity_domains(:praktek).id,
      academic_activity_subdomain_id: academic_activity_subdomains(:tutorial).id
    ) }
    assert_response :unprocessable_entity
    assert_match "tidak termasuk domain yang dipilih", response.body

    post activity_logs_path, params: { activity_log: valid_params(academic_activity_domain_id: academic_activity_domains(:domain_arsip).id) }
    assert_response :unprocessable_entity
    assert_match "sudah dinonaktifkan admin", response.body
  end

  test "kegiatan lama bisa disunting; pilihan nonaktif yang sudah tersimpan tetap sah" do
    log = activity_logs(:jaga_igd)
    log.update_columns(academic_activity_domain_id: academic_activity_domains(:domain_arsip).id)

    get edit_activity_log_path(log)
    assert_response :success
    assert_select "select[name='activity_log[academic_activity_domain_id]'] option[selected]", text: "Domain Arsip"
    assert_select "input[name='activity_log[started_at]'][value^=?]", log.activity_date.strftime("%Y-%m-%d")

    patch activity_log_path(log), params: { activity_log: {
      title: "Jaga IGD (revisi)", started_at: "#{log.activity_date}T09:00", delivery_mode: "luring"
    } }
    assert_redirected_to activity_log_path(log)
    assert_equal "Jaga IGD (revisi)", log.reload.title
  end

  test "menyunting tanpa unggahan baru tidak menghapus lampiran lama; unggahan baru ditambahkan" do
    log = activity_logs(:jaga_igd)
    log.update_columns(academic_activity_domain_id: academic_activity_domains(:praktek).id, delivery_mode: "luring",
                       started_at: log.activity_date.in_time_zone.change(hour: 8))
    log.evidence_files.attach(io: StringIO.new("%PDF-1.4 bukti lama"), filename: "lama.pdf", content_type: "application/pdf")

    patch activity_log_path(log), params: { activity_log: { title: log.title, evidence_files: [ "" ] } }
    assert_redirected_to activity_log_path(log)
    assert_equal [ "lama.pdf" ], log.reload.evidence_files.map { |file| file.filename.to_s }

    upload = Rack::Test::UploadedFile.new(StringIO.new("%PDF-1.4 baru"), "application/pdf", original_filename: "baru.pdf")
    patch activity_log_path(log), params: { activity_log: { title: log.title, evidence_files: [ "", upload ] } }
    assert_equal %w[baru.pdf lama.pdf], log.reload.evidence_files.map { |file| file.filename.to_s }.sort
  end

  test "pengajar bisa melihat (untuk memverifikasi) kegiatan mahasiswa lain, tapi tidak bisa menyunting" do
    get activity_log_path(activity_logs(:kegiatan_siti))
    assert_response :success
    assert_no_match "Sunting", response.body
  end

  test "mahasiswa lain (bukan pengajar) tidak bisa melihat kegiatan milik orang lain" do
    sign_out users(:budi)
    sign_in users(:siti)
    other = User.create!(full_name: "Mahasiswa Lain", email: "mhs.lain@example.com", password: "rahasia-kuat-1", confirmed_at: Time.current)
    other.roles << roles(:mahasiswa)
    log = other.activity_logs.create!(title: "Kegiatan rahasia", category: "non_klinis", activity_date: Date.current)

    get activity_log_path(log)
    assert_redirected_to root_path
  end

  test "generate_patient_code membuat kode untuk kegiatan klinis" do
    log = activity_logs(:jaga_igd)
    assert_nil log.patient_code

    post generate_patient_code_activity_log_path(log)

    assert_redirected_to activity_log_path(log)
    assert log.reload.patient_code.present?
  end

  test "mencatat kegiatan dengan tag kompetensi dan filter menampilkannya" do
    post activity_logs_path, params: {
      activity_log: valid_params(title: "Visite Ruangan", competency_item_ids: [ "", competency_items(:domain_klinis).id ])
    }
    log = ActivityLog.order(:id).last
    assert_equal [ competency_items(:domain_klinis) ], log.competency_items

    get activity_logs_path(competency_item_id: competency_items(:domain_klinis).id)
    assert_match log.title, response.body
    assert_no_match activity_logs(:penyuluhan_stunting).title, response.body
  end

  test "mengosongkan semua centang kompetensi menghapus tautannya" do
    log = activity_logs(:tutorial_siti)
    log.competency_items = [ competency_items(:domain_klinis) ]
    sign_in users(:siti)

    patch activity_log_path(log), params: { activity_log: { title: log.title, competency_item_ids: [ "" ] } }

    assert_redirected_to activity_log_path(log)
    assert_empty log.reload.competency_items
  end

  test "kalender mengelompokkan kegiatan per hari dalam bulan berjalan" do
    log = current_month_log
    get activity_logs_calendar_path

    assert_response :success
    assert_match log.title, response.body
  end

  test "feed iCal bisa diakses tanpa login lewat token" do
    sign_out users(:budi)
    token = users(:siti).calendar_feed_token!

    get activity_logs_feed_path(token: token)

    assert_response :success
    assert_match "BEGIN:VCALENDAR", response.body
    assert_match "DESCRIPTION:Belajar Mengajar - Tutorial", response.body
    assert_match "DESCRIPTION:Klinis - Kunjungan Rumah", response.body
    assert_equal "text/calendar", response.media_type
  end

  test "feed iCal menolak token yang salah" do
    get activity_logs_feed_path(token: "token-salah")
    assert_response :not_found
  end

  private

  def valid_params(**overrides)
    {
      title: "Skrining Gizi", academic_activity_domain_id: academic_activity_domains(:belajar_mengajar).id,
      started_at: "#{Date.current}T08:00", delivery_mode: "luring", description: "Skrining gizi balita."
    }.merge(overrides)
  end

  def current_month_log
    users(:budi).activity_logs.create!(
      title: "Kegiatan Bulan Ini", category: "non_klinis", activity_date: Date.current
    )
  end

  test "pengajar yang membuka kegiatan klinis mahasiswa tidak ditawari tombol Buat Kode Pasien" do
    sign_in users(:budi)
    get activity_log_path(activity_logs(:kegiatan_siti))

    assert_response :success
    assert_select "form[action=?]", generate_patient_code_activity_log_path(activity_logs(:kegiatan_siti)), count: 0
  end
end
