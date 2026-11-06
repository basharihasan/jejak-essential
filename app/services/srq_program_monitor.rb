# frozen_string_literal: true

# Ringkasan SRQ satu prodi untuk kaprodi: hasil TERAKHIR tiap mahasiswa pada
# periode terpilih. Dihitung di memori karena jawaban terenkripsi, dan jumlah
# mahasiswa satu prodi cukup kecil untuk itu.
class SrqProgramMonitor
  Summary = Data.define(:students, :screened, :below_cutoff, :follow_up, :urgent, :pending)
  CohortRow = Data.define(:cohort_year, :students, :screened, :needs_follow_up)

  def initialize(program:, period:, viewer:)
    @program = program
    @period = period
    @viewer = viewer
  end

  def students
    @students ||= User.where(study_program_id: @program.id).where.not(id: @viewer.id)
                      .where(id: UserRole.joins(:role).where(roles: { code: "mahasiswa" }).select(:user_id))
  end

  def latest_screenings
    @latest_screenings ||= begin
      scope = SrqScreening.where(user_id: students.select(:id)).includes(:user, :followed_up_by).recent
      scope = scope.where(screened_on: @period.start_date..@period.end_date) if @period
      scope.to_a.uniq(&:user_id)
    end
  end

  def summary
    levels = latest_screenings.map(&:risk_level).tally
    Summary.new(students: students.count, screened: latest_screenings.size, below_cutoff: levels.fetch("below_cutoff", 0),
                follow_up: levels.fetch("follow_up", 0), urgent: levels.fetch("urgent", 0),
                pending: attention_rows.count { |screening| !screening.followed_up? })
  end

  # Yang segera dan belum ditindaklanjuti tampil paling atas.
  def attention_rows
    @attention_rows ||= latest_screenings.select(&:needs_follow_up?).sort_by do |screening|
      [ screening.followed_up? ? 1 : 0, screening.urgent? ? 0 : 1, -screening.total_score, -screening.screened_on.jd ]
    end
  end

  def cohort_rows
    screened_by_year = latest_screenings.group_by { |screening| screening.user.cohort_year }
    students.group(:cohort_year).count.sort_by { |year, _count| year.to_i }.map do |year, count|
      rows = screened_by_year.fetch(year, [])
      CohortRow.new(cohort_year: year, students: count, screened: rows.size, needs_follow_up: rows.count(&:needs_follow_up?))
    end
  end
end
