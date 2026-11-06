require "test_helper"

class SrqScreeningFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def account(role_code, slug, program: nil, cohort_year: nil)
    user = User.create!(full_name: "Probe #{slug}", email: "#{slug}@example.com", password: "Str0ngPass!x",
                        confirmed_at: Time.current, study_program: program, cohort_year: cohort_year)
    role = roles(role_code)
    user.roles << role
    user.update_column(:active_role_id, role.id)
    user
  end

  def answer_params(*yes_items)
    (1..SrqScreening::QUESTIONS.size).to_h { |number| [ number.to_s, yes_items.include?(number) ? "ya" : "tidak" ] }
  end

  def screening_for(user, *yes_items, on: Date.current)
    answers = Array.new(SrqScreening::QUESTIONS.size) { |index| yes_items.include?(index + 1) }
    user.srq_screenings.create!(screened_on: on, answers: answers, consented_at: Time.current)
  end

  test "mahasiswa mengisi, melihat hasil, dan bantuan tampil pada butir 17" do
    sign_in users(:siti)
    get srq_screenings_path
    assert_response :success
    get new_srq_screening_path
    assert_select "input[type=radio]", SrqScreening::QUESTIONS.size * 2

    assert_difference "SrqScreening.count", 1 do
      post srq_screenings_path, params: { srq_answers: answer_params(1, 17), consent: "1" }
    end
    screening = users(:siti).srq_screenings.last
    assert_redirected_to srq_screening_path(screening)
    follow_redirect!
    assert_response :success
    assert_match "119 ekstensi 8", response.body
    assert_match "Perlu Perhatian Segera", response.body
    assert_equal 2, screening.total_score
    assert screening.consented_at.present?
  end

  test "hasil di bawah ambang tidak menampilkan kotak darurat" do
    sign_in users(:siti)
    post srq_screenings_path, params: { srq_answers: answer_params(1), consent: "1" }
    follow_redirect!
    assert_select "[role=alert]", 0
    assert_match "Di Bawah Ambang", response.body
  end

  test "tanpa persetujuan atau dengan butir kosong ditolak, dan pilihan tidak hilang" do
    sign_in users(:siti)
    assert_no_difference "SrqScreening.count" do
      post srq_screenings_path, params: { srq_answers: answer_params(3) }
    end
    assert_response :unprocessable_entity
    assert_match(/wajib disetujui/i, response.body)
    assert_select "input[type=radio][name=?][value=ya][checked]", "srq_answers[3]"

    incomplete = answer_params.except("20")
    assert_no_difference "SrqScreening.count" do
      post srq_screenings_path, params: { srq_answers: incomplete, consent: "1" }
    end
    assert_response :unprocessable_entity
    assert_match(/wajib dijawab/i, response.body)
  end

  test "kiriman rusak ditolak tanpa galat" do
    sign_in users(:siti)
    post srq_screenings_path, params: { srq_answers: "bukan-hash", consent: "1" }
    assert_response :unprocessable_entity
  end

  test "pengisian kedua pada hari yang sama tidak menggandakan data" do
    screening = screening_for(users(:siti), 1)
    sign_in users(:siti)
    get new_srq_screening_path
    assert_redirected_to srq_screening_path(screening)
    assert_no_difference "SrqScreening.count" do
      post srq_screenings_path, params: { srq_answers: answer_params(2), consent: "1" }
    end
  end

  test "mahasiswa hanya membuka hasil miliknya" do
    screening = screening_for(users(:siti), 1)
    sign_in account(:mahasiswa, "mahasiswa-lain", program: study_programs(:sarjana_kedokteran))
    get srq_screening_path(screening)
    assert_response :not_found
  end

  test "pengajar dan kaprodi tidak membuka halaman hasil mahasiswa" do
    screening = screening_for(users(:siti), 1)
    [ users(:budi), users(:dedi) ].each do |user|
      sign_in user
      get srq_screening_path(screening)
      assert_redirected_to dashboard_path
      sign_out user
    end
  end

  test "jawaban tidak tercatat di log" do
    sign_in users(:siti)
    logged = nil
    capture = ->(_name, _started, _finished, _id, payload) { logged = payload[:params] }
    ActiveSupport::Notifications.subscribed(capture, "start_processing.action_controller") do
      post srq_screenings_path, params: { srq_answers: answer_params(17), consent: "1" }
    end
    assert_equal "[FILTERED]", logged["srq_answers"]
  end

  test "kaprodi memantau prodinya tanpa melihat jawaban per butir" do
    urgent = screening_for(users(:siti), 17)
    outside = account(:mahasiswa, "mhs-pspd", program: study_programs(:profesi_dokter))
    screening_for(outside, 1, 2, 3, 4, 5, 6)

    sign_in users(:dedi)
    get srq_monitoring_path
    assert_response :success
    assert_select "[data-testid=?]", "srq-row-#{urgent.id}"
    assert_match users(:siti).full_name, response.body
    assert_match "Perlu Perhatian Segera", response.body
    assert_no_match outside.full_name, response.body
    assert_no_match "mengakhiri hidup", response.body
    assert_no_match SrqScreening::QUESTIONS.first, response.body
  end

  test "hasil di bawah ambang hanya masuk ringkasan, dan hasil terakhir yang dipakai" do
    screening_for(users(:siti), 1, 2, 3, 4, 5, 6, on: 2.days.ago.to_date)
    latest = screening_for(users(:siti), 1)

    sign_in users(:dedi)
    get srq_monitoring_path
    assert_response :success
    assert_select "[data-testid=?]", "srq-row-#{latest.id}", 0
    assert_match "Tidak ada hasil yang perlu ditindaklanjuti", response.body
  end

  test "kaprodi mencatat tindak lanjut; catatan wajib dan terkunci ke prodinya" do
    screening = screening_for(users(:siti), 17)
    outside = screening_for(account(:mahasiswa, "mhs-pspd", program: study_programs(:profesi_dokter)), 17)

    sign_in users(:dedi)
    patch srq_monitoring_follow_up_path(screening), params: { follow_up_note: "  " }
    assert_not screening.reload.followed_up?

    patch srq_monitoring_follow_up_path(screening), params: { follow_up_note: "Sudah bertemu dan dirujuk ke konselor" }
    assert_redirected_to srq_monitoring_path
    screening.reload
    assert screening.followed_up?
    assert_equal users(:dedi), screening.followed_up_by
    follow_redirect!
    assert_match "Sudah bertemu dan dirujuk ke konselor", response.body

    patch srq_monitoring_follow_up_path(outside), params: { follow_up_note: "Tidak boleh" }
    assert_response :not_found
    assert_not outside.reload.followed_up?
  end

  test "hanya kaprodi berprodi yang masuk monitoring" do
    no_program = account(:kaprodi, "kaprodi-kosong")
    admin = account(:admin, "admin-saja")
    [ users(:siti), users(:budi), users(:wati), admin, no_program ].each do |user|
      sign_in user
      get srq_monitoring_path
      assert_redirected_to dashboard_path
      sign_out user
    end
  end

  test "menu tampil sesuai peran" do
    sign_in users(:siti)
    get dashboard_path
    assert_select "a[href=?]", srq_screenings_path
    assert_select "a[href=?]", srq_monitoring_path, 0
    sign_out users(:siti)

    kaprodi = users(:dedi)
    kaprodi.update_column(:active_role_id, roles(:kaprodi).id)
    sign_in kaprodi
    get dashboard_path
    assert_select "a[href=?]", srq_monitoring_path
    assert_select "a[href=?]", srq_screenings_path, 0
    sign_out kaprodi

    admin = account(:admin, "admin-saja")
    sign_in admin
    get dashboard_path
    assert_select "a[href=?]", srq_monitoring_path, 0
  end

  test "kaprodi yang juga mahasiswa tidak melihat hasilnya sendiri di monitoring" do
    kaprodi = users(:dedi)
    kaprodi.roles << roles(:mahasiswa)
    own = screening_for(kaprodi, 17)

    sign_in kaprodi
    get srq_monitoring_path
    assert_select "[data-testid=?]", "srq-row-#{own.id}", 0
  end

  test "ringkasan kaprodi menghitung per kategori dan per angkatan" do
    users(:siti).update_column(:cohort_year, 2023)
    screening_for(users(:siti), 17)
    calm = account(:mahasiswa, "mhs-tenang", program: study_programs(:sarjana_kedokteran), cohort_year: 2024)
    screening_for(calm, 1)
    account(:mahasiswa, "mhs-belum", program: study_programs(:sarjana_kedokteran), cohort_year: 2024)

    monitor = SrqProgramMonitor.new(program: study_programs(:sarjana_kedokteran), period: nil, viewer: users(:dedi))
    summary = monitor.summary
    assert_equal 2, summary.screened
    assert_equal 1, summary.below_cutoff
    assert_equal 1, summary.urgent
    assert_equal 1, summary.pending

    row = monitor.cohort_rows.find { |candidate| candidate.cohort_year == 2024 }
    assert_equal [ 2, 1, 0 ], [ row.students, row.screened, row.needs_follow_up ]
  end

  test "data SRQ tidak ikut paket migrasi maupun Ekspor Data" do
    assert_not_includes MigrationExporter::FULL_TABLES, "srq_screenings"
    assert DataExport::DATASETS.keys.none? { |key| key.to_s.include?("srq") }
  end
end
