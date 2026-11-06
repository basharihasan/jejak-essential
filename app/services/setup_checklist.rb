# frozen_string_literal: true

# Daftar langkah penyiapan di Beranda: apa yang masih perlu dikerjakan admin
# atau kaprodi pada instalasi yang baru. Tiap langkah dihitung dari data
# sungguhan, tanpa tabel atau tanda "selesai" tersendiri, jadi panelnya hilang
# sendiri begitu langkah wajibnya beres dan muncul lagi bila kondisinya berubah
# (mis. periode berjalan sudah berakhir).
class SetupChecklist
  include Rails.application.routes.url_helpers

  # path nil = dikerjakan peran lain; optional = tidak menahan panel tetap tampil.
  Step = Data.define(:label, :detail, :path, :done, :optional) do
    def required? = !optional
  end

  attr_reader :steps

  # nil bila peran aktif ini tidak punya langkah penyiapan atau semuanya beres.
  def self.pending_for(user, role_code)
    checklist = new(user, role_code)
    checklist if checklist.steps.any? && !checklist.complete?
  end

  def initialize(user, role_code)
    @user = user
    @steps = case role_code
    when "admin" then admin_steps
    when "kaprodi" then user.study_program ? kaprodi_steps(user.study_program) : []
    else []
    end
  end

  def complete? = steps.select(&:required?).all?(&:done)
  def done_count = steps.count(&:done)

  private

  def step(label, detail, path, done, optional: false)
    Step.new(label: label, detail: detail, path: path, done: done, optional: optional)
  end

  def admin_steps
    [
      step("Periode akademik berjalan", "Tanggal hari ini harus berada di dalam satu periode.", academic_periods_path, AcademicPeriod.current.exists?),
      step("Akun mahasiswa dan pembimbing", "Impor lewat CSV, lengkap dengan peran dan prodi.", import_admin_users_path, students_and_supervisors?),
      step("Kaprodi dengan prodi binaan", "Tiap kaprodi perlu prodi, karena itulah batas aksesnya.", admin_users_path(role: "kaprodi"), kaprodi_ready?),
      step("Penempatan pada periode berjalan", "Rotasi klinik atau enrolment tutorial, bisa lewat impor CSV.", clinical_rotations_path, placements_in_current_period?),
      step("Event asesmen", "Wadah nilai ujian, rubrik, dan CBD/Long Case.", admin_assessment_events_path, AssessmentEvent.exists?),
      step("Target kasus logbook", "Tanpa target, kartu pemenuhan target tidak tampil bagi mahasiswa.", admin_logbook_case_targets_path, LogbookCaseTarget.exists?, optional: true),
      step("Kerangka Peta EPA tiap prodi", "Pilih di halaman Program Studi. Bila kosong, dipakai kerangka paling awal.", study_programs_path, frameworks_chosen?, optional: true),
      step("Pendaftaran mandiri ditutup", "Bila terbuka, siapa pun yang tahu alamat aplikasi bisa membuat akun mahasiswa.", admin_users_path, !AppSetting.registration_open?, optional: true)
    ]
  end

  def kaprodi_steps(program)
    students = active_students.where(study_program_id: program.id)
    [
      step("Akun mahasiswa #{program.name}", "Dikerjakan admin lewat impor CSV.", nil, students.exists?),
      step("Penempatan pada periode berjalan", "Dikerjakan admin lewat Rotasi Klinik atau Enrolment Tutorial.", nil, placements_in_current_period?(students)),
      step("Learning Unit dan bobot nilai", "Susun komponen nilai tiap blok atau stase.", admin_learning_units_path, LearningUnit.exists?(study_program_id: program.id)),
      step("Keputusan SRQ-20", "Aktifkan setelah SOP tindak lanjut siap.", srq_monitoring_path, program.srq_enabled?, optional: true)
    ]
  end

  def active_students
    User.active_accounts.where(id: UserRole.joins(:role).where(roles: { code: "mahasiswa" }).select(:user_id))
  end

  def students_and_supervisors?
    supervisors = UserRole.joins(:role).where(roles: { code: %w[dosen preseptor] }).select(:user_id)
    active_students.exists? && User.active_accounts.exists?(id: supervisors)
  end

  # Kaprodi yang juga admin tidak terikat prodi, jadi tidak perlu prodi.
  def kaprodi_ready?
    role_users = ->(code) { UserRole.joins(:role).where(roles: { code: code }).select(:user_id) }
    kaprodis = User.active_accounts.where(id: role_users.call("kaprodi"))
    kaprodis.exists? && !kaprodis.where(study_program_id: nil).where.not(id: role_users.call("admin")).exists?
  end

  def placements_in_current_period?(students = nil)
    periods = AcademicPeriod.current.select(:id)
    [ ClinicalRotation, TutorialEnrollment ].any? do |model|
      scope = model.where(academic_period_id: periods)
      scope = scope.where(user_id: students.select(:id)) if students
      scope.exists?
    end
  end

  def frameworks_chosen?
    programs = StudyProgram.where(id: active_students.where.not(study_program_id: nil).select(:study_program_id))
    programs.exists? && !programs.where(competency_framework_id: nil).exists?
  end
end
