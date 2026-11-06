require "test_helper"

class SrqScreeningTest < ActiveSupport::TestCase
  def answers_with(*yes_items)
    Array.new(SrqScreening::QUESTIONS.size) { |index| yes_items.include?(index + 1) }
  end

  def build(*yes_items, user: users(:siti), **attrs)
    SrqScreening.new(user: user, screened_on: Date.current, consented_at: Time.current, answers: answers_with(*yes_items), **attrs)
  end

  test "instrumen berisi 20 butir dan butir 17 adalah pikiran mengakhiri hidup" do
    assert_equal 20, SrqScreening::QUESTIONS.size
    assert_equal SrqScreening::QUESTIONS.size, SrqScreening::QUESTIONS.uniq.size
    assert_match "mengakhiri hidup", SrqScreening::QUESTIONS[SrqScreening::SUICIDAL_THOUGHT_ITEM - 1]
  end

  test "skor adalah jumlah jawaban ya dan ambangnya 6" do
    below = build(1, 2, 3, 4, 5)
    assert_equal 5, below.total_score
    assert_not below.needs_follow_up?
    assert_equal "below_cutoff", below.risk_level

    at_cutoff = build(1, 2, 3, 4, 5, 6)
    assert_equal 6, at_cutoff.total_score
    assert at_cutoff.needs_follow_up?
    assert_equal "follow_up", at_cutoff.risk_level
  end

  test "butir 17 selalu perlu perhatian segera walau skornya rendah" do
    screening = build(17)
    assert_equal 1, screening.total_score
    assert screening.urgent?
    assert screening.needs_follow_up?
    assert_equal "urgent", screening.risk_level
  end

  test "jawaban dan catatan tersimpan terenkripsi, tanpa kolom skor" do
    screening = build(1, 17)
    screening.save!
    screening.record_follow_up!(by: users(:dedi), note: "Sudah dirujuk ke konselor")

    raw = SrqScreening.connection.select_one("SELECT answers, follow_up_note FROM srq_screenings WHERE id = #{screening.id}")
    assert_no_match(/true|false/, raw["answers"])
    assert_no_match "konselor", raw["follow_up_note"]

    screening.reload
    assert_equal answers_with(1, 17), screening.answers
    assert_equal "Sudah dirujuk ke konselor", screening.follow_up_note
    assert_not_includes SrqScreening.column_names, "total_score"
  end

  test "semua butir wajib dijawab dan persetujuan wajib ada" do
    incomplete = build(1)
    incomplete.answers = incomplete.answers.tap { |list| list[3] = nil }
    assert_not incomplete.valid?
    assert incomplete.errors[:answers].any?

    too_short = build
    too_short.answers = [ true ]
    assert_not too_short.valid?

    assert_not build(1, consented_at: nil).valid?
  end

  test "satu pengisian per hari per mahasiswa" do
    build(1).save!
    assert_not build(2).valid?
    assert build(2, user: users(:budi)).valid?
  end

  test "hasil perlu perhatian memberi tahu kaprodi prodinya tanpa nama, skor, atau butir" do
    assert_difference -> { users(:dedi).notifications.count }, 1 do
      build(17).save!
    end
    notification = users(:dedi).notifications.recent.first
    text = [ notification.title, notification.message ].join(" ")
    assert_match "perhatian segera", text
    assert_no_match users(:siti).full_name, text
    assert_no_match(/\d/, text)
    assert_nil notification.notifiable
    assert_nil notification.sender
  end

  test "hasil di bawah ambang tidak memicu notifikasi" do
    assert_no_difference "Notification.count" do
      build(1).save!
    end
  end

  test "mahasiswa tanpa prodi atau prodi tanpa kaprodi tidak menimbulkan galat" do
    student = User.create!(full_name: "Tanpa Prodi", email: "tanpa-prodi@example.com", password: "Str0ngPass!x", confirmed_at: Time.current)
    student.roles << roles(:mahasiswa)
    assert_no_difference "Notification.count" do
      build(17, user: student).save!
    end
  end
end
