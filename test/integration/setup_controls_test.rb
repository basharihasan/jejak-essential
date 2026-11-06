require "test_helper"
require "rake"

# Aktivasi SRQ per prodi, kerangka Peta EPA per prodi, langkah penyiapan di
# Beranda, seed tanpa data contoh, dan pembuatan admin pertama.
class SetupControlsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @pssk = study_programs(:sarjana_kedokteran)
    @pspd = study_programs(:profesi_dokter)
    @kaprodi = users(:dedi) # kaprodi Sarjana Kedokteran
    @siti = users(:siti)    # mahasiswa Sarjana Kedokteran
  end

  def admin
    @admin ||= users(:budi).tap do |user|
      user.roles << roles(:admin)
      user.update!(active_role: roles(:admin))
    end
  end

  def readiness = { ready_sop: "1", ready_instrument: "1", ready_counselor: "1" }

  # ── SRQ ──

  test "SRQ prodi yang belum aktif: menu hilang dan halaman tertutup bagi mahasiswa" do
    @pssk.disable_srq!
    sign_in @siti

    get dashboard_path
    assert_select "aside#sidebar a[href=?]", srq_screenings_path, count: 0
    get srq_screenings_path
    assert_redirected_to dashboard_path
    get new_srq_screening_path
    assert_redirected_to dashboard_path
    assert_no_difference("SrqScreening.count") { post srq_screenings_path, params: { consent: "1" } }
  end

  test "kaprodi mengaktifkan SRQ hanya setelah menyatakan ketiga kesiapan" do
    @pssk.disable_srq!
    sign_in @kaprodi
    get srq_monitoring_path
    assert_match "belum aktif", response.body
    assert_select "input[type=checkbox][required]", SrqMonitoringController::READINESS_ITEMS.size

    patch srq_monitoring_status_path, params: { enabled: "1", ready_sop: "1" }
    assert_not @pssk.reload.srq_enabled?
    assert_match "Centang ketiga kesiapan", flash[:alert]

    patch srq_monitoring_status_path, params: { enabled: "1", **readiness }
    assert @pssk.reload.srq_enabled?
    assert_equal @kaprodi, @pssk.srq_enabled_by
    sign_out @kaprodi

    sign_in @siti
    get dashboard_path
    assert_select "aside#sidebar a[href=?]", srq_screenings_path
    get new_srq_screening_path
    assert_response :success
  end

  test "SRQ dinonaktifkan: riwayat tetap terbuka, pengisian baru tertutup" do
    answers = Array.new(SrqScreening::QUESTIONS.size) { false }
    screening = @siti.srq_screenings.create!(screened_on: Date.current, answers: answers, consented_at: Time.current)
    sign_in @kaprodi
    patch srq_monitoring_status_path, params: { enabled: "0" }
    assert_not @pssk.reload.srq_enabled?
    sign_out @kaprodi

    sign_in @siti
    get dashboard_path
    assert_select "aside#sidebar a[href=?]", srq_screenings_path
    get srq_screenings_path
    assert_response :success
    assert_match "sedang dinonaktifkan", response.body
    get srq_screening_path(screening)
    assert_response :success
    get new_srq_screening_path
    assert_redirected_to srq_screenings_path
  end

  test "aktivasi SRQ hanya untuk prodi kaprodi itu dan hanya oleh kaprodi" do
    @pspd.disable_srq!
    sign_in @kaprodi
    patch srq_monitoring_status_path, params: { enabled: "1", study_program_id: @pspd.id, **readiness }
    assert_not @pspd.reload.srq_enabled?
    sign_out @kaprodi

    @pssk.disable_srq!
    sign_in admin
    patch srq_monitoring_status_path, params: { enabled: "1", **readiness }
    assert_redirected_to dashboard_path
    assert_not @pssk.reload.srq_enabled?
  end

  # ── Kerangka Peta EPA ──

  test "mahasiswa memakai kerangka pilihan prodinya, atau kerangka paling awal" do
    earliest = CompetencyFramework.order(:id).first
    assert_equal earliest, CompetencyFramework.for_student(@siti)

    other = CompetencyFramework.create!(name: "Kerangka Prodi")
    domain = other.competency_items.create!(title: "Ranah Khusus Prodi")
    @pssk.update!(competency_framework: other)

    assert_equal other, CompetencyFramework.for_student(@siti.reload)
    assert_equal earliest, CompetencyFramework.for_student(nil)

    sign_in @siti
    get entrustment_decisions_path
    assert_match domain.title, response.body
  end

  test "form verifikasi menawarkan EPA kerangka prodi mahasiswa pemilik kasus" do
    other = CompetencyFramework.create!(name: "Kerangka Prodi")
    other.competency_items.create!(title: "Ranah Khusus Prodi")
    @pssk.update!(competency_framework: other)

    sign_in users(:budi)
    get clinical_case_path(clinical_cases(:submitted_case_siti))
    assert_match "Ranah Khusus Prodi", response.body
  end

  test "admin memilih kerangka di Program Studi, dan pilihan itu terlihat; hapus kerangka melepas pilihan" do
    other = CompetencyFramework.create!(name: "Kerangka Prodi")
    sign_in admin
    get edit_study_program_path(@pssk)
    assert_select "select[name='study_program[competency_framework_id]'] option", text: "Kerangka Prodi"

    patch study_program_path(@pssk), params: { study_program: { competency_framework_id: other.id } }
    assert_equal other, @pssk.reload.competency_framework
    get study_programs_path
    assert_match "Kerangka Prodi", response.body
    get competency_frameworks_path
    assert_match "Dipakai Peta EPA: #{@pssk.name}", response.body

    other.destroy!
    assert_nil @pssk.reload.competency_framework
  end

  # ── Langkah penyiapan ──

  test "admin melihat langkah yang belum selesai, tanpa pesan Semua beres" do
    AssessmentEvent.destroy_all
    sign_in admin
    get dashboard_path

    assert_select "[data-testid=setup-checklist]"
    assert_select "[data-setup-step=todo]", text: /Event asesmen/
    assert_select "[data-testid=all-clear]", count: 0
    assert_select "[data-testid=setup-checklist] a[href*=?]", "panduan-penyiapan"
  end

  test "panel hilang begitu langkah wajib beres, walau langkah anjuran belum" do
    checklist = SetupChecklist.new(admin, "admin")
    assert checklist.steps.select(&:required?).all?(&:done), "fixture memenuhi semua langkah wajib"
    assert checklist.steps.reject(&:done).all?(&:optional)
    assert_nil SetupChecklist.pending_for(admin, "admin")

    sign_in admin
    get dashboard_path
    assert_select "[data-testid=setup-checklist]", count: 0
  end

  test "langkah admin terhitung dari data: kaprodi tanpa prodi dan periode lewat" do
    @kaprodi.update!(study_program: nil)
    step = ->(label) { SetupChecklist.new(admin, "admin").steps.find { |s| s.label == label } }
    assert_not step.call("Kaprodi dengan prodi binaan").done

    @kaprodi.update!(study_program: @pssk)
    assert step.call("Kaprodi dengan prodi binaan").done

    academic_periods(:current_period).update!(start_date: 2.months.ago.to_date, end_date: 1.month.ago.to_date)
    assert_not step.call("Periode akademik berjalan").done
  end

  test "kaprodi melihat langkah prodinya, bukan milik prodi lain; peran lain tidak" do
    sign_in @kaprodi
    get dashboard_path
    assert_select "[data-testid=setup-checklist]", text: /Learning Unit/
    assert_select "[data-testid=no-queue-yet]"

    LearningUnit.create!(name: "Blok Uji", study_program: @pspd)
    assert_not SetupChecklist.new(@kaprodi, "kaprodi").steps.find { |s| s.label.start_with?("Learning Unit") }.done

    LearningUnit.create!(name: "Blok Uji", study_program: @pssk)
    assert_nil SetupChecklist.pending_for(@kaprodi, "kaprodi")

    assert_nil SetupChecklist.pending_for(users(:wati), "preseptor")
    assert_empty SetupChecklist.new(users(:dedi).tap { |u| u.study_program = nil }, "kaprodi").steps
  end

  # ── Seed & admin pertama ──

  test "db:seed tidak menambah data contoh walau periode sudah ada, dan aman diulang" do
    assert_no_difference [ "AssessmentEvent.count", "LearningUnit.count", "AssessmentDimension.count", "AssessmentMapping.count" ] do
      Rails.application.load_seed
    end
  end

  test "db:seed menutup pendaftaran hanya pada instalasi baru tanpa akun" do
    Rails.application.load_seed
    assert_nil AppSetting.find_by(key: AppSetting::REGISTRATION_KEY), "instalasi lama tidak berubah"
    assert AppSetting.registration_open?
  end

  def run_task(name, env = {})
    Rails.application.load_tasks unless Rake::Task.task_defined?(name)
    originals = env.keys.index_with { |key| ENV[key] }
    env.each { |key, value| ENV[key] = value }
    Rake::Task[name].reenable
    capture_io { Rake::Task[name].invoke }.first
  ensure
    originals.each { |key, value| ENV[key] = value }
  end

  test "admin pertama dibuat dari ENV sekali saja, dan kata sandinya wajib diganti" do
    assert_not UserRole.joins(:role).exists?(roles: { code: "admin" })

    run_task("users:bootstrap_admin", "ADMIN_EMAIL" => "Admin@Kampus.ac.id", "ADMIN_PASSWORD" => "sandi-awal-123", "ADMIN_NAME" => "Admin Kampus")
    user = User.find_by!(email: "admin@kampus.ac.id")
    assert user.has_role?("admin")
    assert user.must_change_password?
    assert user.valid_password?("sandi-awal-123")
    assert_equal roles(:admin), user.active_role

    out = run_task("users:bootstrap_admin", "ADMIN_EMAIL" => "lain@kampus.ac.id", "ADMIN_PASSWORD" => "sandi-lain-123")
    assert_match "sudah ada admin", out
    assert_not User.exists?(email: "lain@kampus.ac.id")
    assert user.reload.valid_password?("sandi-awal-123"), "kata sandi admin tidak boleh ikut direset"
  end

  test "admin pertama: isian kosong atau lemah tidak menggagalkan start aplikasi" do
    assert_no_difference("User.count") do
      assert_equal "", run_task("users:bootstrap_admin", "ADMIN_EMAIL" => "", "ADMIN_PASSWORD" => "")
      assert_match "minimal 8", run_task("users:bootstrap_admin", "ADMIN_EMAIL" => "a@b.id", "ADMIN_PASSWORD" => "pendek")
    end
  end

  test "demo:seed ditolak di production kecuali diminta eksplisit dengan kata sandi sendiri" do
    original_env = Rails.env
    Rails.env = "production"
    [ {}, { "ALLOW_DEMO_DATA" => "1" }, { "DEMO_PASSWORD" => "sandi-demo-42" } ].each do |env|
      assert_no_difference("User.count") do
        assert_raises(SystemExit) do
          run_task("demo:seed", { "ALLOW_DEMO_DATA" => nil, "DEMO_PASSWORD" => nil }.merge(env))
        end
      end
    end
  ensure
    Rails.env = original_env
  end
end
