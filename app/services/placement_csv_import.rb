# frozen_string_literal: true

require "csv"

# Impor penempatan mahasiswa dari CSV: dasar bersama ClinicalRotationCsvImport
# dan TutorialEnrollmentCsvImport. Selalu dua tahap, sama dengan
# StudentProgramRelabeler: #matches mencocokkan tanpa menyimpan apa pun, #apply!
# menyimpan semua baris siap dalam satu transaksi.
#
# Aman diulang: baris dengan mahasiswa, periode, dan bagian/blok yang sama
# memperbarui penempatan lama, bukan menggandakannya. Isian kosong pada baris
# pembaruan tidak menghapus nilai lama.
class PlacementCsvImport
  class Error < StandardError; end

  MAX_ROWS = 2000
  READY = "siap"

  BASE_ALIASES = {
    identifier: %w[email e_mail surel npm nim identifier email_npm],
    period: %w[periode periode_akademik semester],
    start_date: %w[mulai tanggal_mulai start_date],
    end_date: %w[selesai tanggal_selesai end_date]
  }.freeze

  Match = Struct.new(:line, :identifier, :student, :period, :place, :detail, :start_date, :end_date,
                     :supervisor, :record, :note, keyword_init: true) do
    def eligible? = note == READY
    def action = record&.new_record? ? "baru" : "diperbarui"
  end

  Result = Struct.new(:created, :updated, :skipped, keyword_init: true)

  def initialize(csv:, default_period: nil, actor: nil)
    @csv = CsvUpload.decode(csv)
    @default_period = default_period
    @actor = actor
  end

  def matches
    @matches ||= resolve(parse_rows)
  end

  def apply!
    ready = matches.select(&:eligible?)
    created = ready.count { |match| match.record.new_record? }
    model.transaction { ready.each { |match| match.record.save! } }

    Rails.logger.info("[placement_import] actor_id=#{@actor&.id} model=#{model.name} created=#{created} " \
                      "updated=#{ready.size - created} skipped=#{matches.size - ready.size}")
    Result.new(created: created, updated: ready.size - created, skipped: matches.size - ready.size)
  end

  private

  def aliases = BASE_ALIASES.merge(self.class::COLUMN_ALIASES)

  def parse_rows
    return [] if @csv.strip.empty?

    table = CSV.parse(@csv, headers: true, col_sep: separator,
                            header_converters: ->(header) { header.to_s.strip.downcase.gsub(/[\s\/-]+/, "_") })
    columns = aliases.transform_values { |names| table.headers.find { |header| names.include?(header) } }
    raise Error, "Kolom 'email' tidak ditemukan di CSV — unduh template dan cocokkan nama kolomnya." unless columns[:identifier]
    raise Error, "Kolom '#{self.class::COLUMN_ALIASES[:place].first}' tidak ditemukan di CSV — unduh template dan cocokkan nama kolomnya." unless columns[:place]

    rows = table.each.with_index(2).filter_map do |row, line|
      identifier = row[columns[:identifier]].to_s.strip
      next if identifier.empty?

      columns.keys.index_with { |key| columns[key] && row[columns[key]].to_s.strip.presence }.merge(line: line, identifier: identifier)
    end
    raise Error, "CSV berisi #{rows.size} baris — maksimal #{MAX_ROWS} per unggahan, pecah berkasnya." if rows.size > MAX_ROWS

    rows
  rescue CSV::MalformedCSVError => e
    raise Error, "CSV tidak dapat dibaca: #{e.message}"
  end

  def separator
    first = @csv.lines.first.to_s
    first.count(";") > first.count(",") ? ";" : ","
  end

  def resolve(rows)
    load_lookups(rows)
    seen = {}
    rows.map { |row| resolve_row(row, seen) }
  end

  def load_lookups(rows)
    identifiers = rows.map { |row| row[:identifier] }
    emails = identifiers.select { |id| id.include?("@") }.map(&:downcase).uniq
    npms = identifiers.reject { |id| id.include?("@") }.uniq
    users = User.includes(:roles)
    @students_by_email = users.where("LOWER(email) IN (?)", emails).index_by { |user| user.email.downcase }
    @students_by_npm = users.where(identifier_number: npms).group_by(&:identifier_number)
    supervisor_emails = rows.filter_map { |row| row[:supervisor]&.downcase }.uniq
    @supervisors = users.where("LOWER(email) IN (?)", supervisor_emails).index_by { |user| user.email.downcase }
    @periods = AcademicPeriod.all.index_by { |period| period.name.downcase }
    student_ids = (@students_by_email.values + @students_by_npm.values.flatten).map(&:id)
    @existing = model.where(user_id: student_ids).group_by { |record| [ record.user_id, record.academic_period_id, place_of(record).downcase ] }
  end

  def resolve_row(row, seen)
    match = Match.new(line: row[:line], identifier: row[:identifier], place: row[:place], detail: row[:detail])
    student_note = assign_student(match, row)
    return reject(match, student_note) if student_note

    match.period = row[:period] ? @periods[row[:period].downcase] : @default_period
    return reject(match, row[:period] ? "periode \"#{row[:period]}\" tidak dikenal" : "periode kosong — isi kolom atau pilih di form") if match.period.nil?
    return reject(match, "#{self.class::PLACE_LABEL.downcase} kosong") if row[:place].blank?

    key = [ match.student.id, match.period.id, row[:place].downcase ]
    return reject(match, "dobel di CSV ini — dilewati") if seen[key]

    seen[key] = true
    date_note = assign_dates(match, row)
    return reject(match, date_note) if date_note

    supervisor_note = assign_supervisor(match, row)
    return reject(match, supervisor_note) if supervisor_note

    build_record(match, key)
  end

  def assign_student(match, row)
    identifier = row[:identifier]
    candidates = identifier.include?("@") ? Array(@students_by_email[identifier.downcase]) : Array(@students_by_npm[identifier])
    return "mahasiswa tidak ditemukan" if candidates.empty?
    return "NPM dimiliki lebih dari satu akun" if candidates.size > 1

    match.student = candidates.first
    return "akun ini bukan mahasiswa" unless match.student.roles.any? { |role| role.code == "mahasiswa" }

    "akun ini nonaktif" if match.student.deactivated?
  end

  def assign_dates(match, row)
    %i[start_date end_date].each do |column|
      next if row[column].blank?

      match[column] = parse_date(row[column])
      return "tanggal \"#{row[column]}\" tidak dikenali — pakai TTTT-BB-HH atau HH/BB/TTTT" if match[column].nil?
    end
    nil
  end

  def parse_date(text)
    case text
    when /\A(\d{4})-(\d{1,2})-(\d{1,2})\z/ then Date.new($1.to_i, $2.to_i, $3.to_i)
    when %r{\A(\d{1,2})[/.-](\d{1,2})[/.-](\d{4})\z} then Date.new($3.to_i, $2.to_i, $1.to_i)
    end
  rescue Date::Error
    nil
  end

  def assign_supervisor(match, row)
    return if row[:supervisor].blank?

    match.supervisor = @supervisors[row[:supervisor].downcase]
    label = self.class::SUPERVISOR_LABEL.downcase
    return "#{label} \"#{row[:supervisor]}\" tidak ditemukan" if match.supervisor.nil?
    return "#{label} \"#{row[:supervisor]}\" akunnya nonaktif" if match.supervisor.deactivated?

    allowed = match.supervisor.roles.any? { |role| self.class::SUPERVISOR_ROLES.include?(role.code) }
    "#{label} \"#{row[:supervisor]}\" tidak berperan #{self.class::SUPERVISOR_ROLES.join(' atau ')}" unless allowed
  end

  def build_record(match, key)
    record = @existing[key]&.first || model.new(user: match.student, academic_period: match.period)
    record.assign_attributes(placement_attributes(match).compact)
    match.record = record
    match.note = record.valid? ? READY : record.errors.full_messages.to_sentence
    match
  end

  def reject(match, note)
    match.note = note
    match
  end
end
