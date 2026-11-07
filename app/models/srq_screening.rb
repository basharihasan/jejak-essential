# frozen_string_literal: true

# Self Reporting Questionnaire 20 (SRQ-20, WHO): skrining mandiri gejala
# emosional 30 hari terakhir, ya/tidak. Skor = jumlah jawaban "ya". Ini
# penapisan, bukan diagnosis.
#
# Data kesehatan termasuk data pribadi spesifik, jadi:
#   - hanya jawaban dan catatan tindak lanjut yang disimpan, keduanya
#     terenkripsi; skor dan kategori selalu dihitung dari jawaban;
#   - pengisian sukarela dan mensyaratkan persetujuan eksplisit, karena skor
#     dan kategorinya terlihat oleh kaprodi prodi mahasiswa;
#   - kaprodi tidak pernah melihat jawaban per butir, dan pengguna lain
#     (termasuk admin) tidak melihat hasil sama sekali;
#   - tidak ikut Ekspor Data.
class SrqScreening < ApplicationRecord
  # Urutan butir mengikuti SRQ-20 WHO. Rumusan bahasa Indonesia perlu ditinjau
  # ahli konten terhadap versi resmi yang dipakai institusi.
  QUESTIONS = [
    "Apakah Anda sering menderita sakit kepala?",
    "Apakah nafsu makan Anda buruk?",
    "Apakah Anda sulit tidur?",
    "Apakah Anda mudah merasa takut?",
    "Apakah tangan Anda gemetar?",
    "Apakah Anda merasa gugup, tegang, atau khawatir?",
    "Apakah pencernaan Anda terganggu?",
    "Apakah Anda sulit berpikir jernih?",
    "Apakah Anda merasa tidak bahagia?",
    "Apakah Anda menangis lebih sering dari biasanya?",
    "Apakah Anda sulit menikmati kegiatan sehari-hari?",
    "Apakah Anda sulit mengambil keputusan?",
    "Apakah pekerjaan atau kegiatan sehari-hari Anda terganggu?",
    "Apakah Anda merasa tidak mampu berperan dalam hidup ini?",
    "Apakah Anda kehilangan minat pada berbagai hal?",
    "Apakah Anda merasa diri Anda tidak berharga?",
    "Apakah pikiran untuk mengakhiri hidup pernah muncul dalam benak Anda?",
    "Apakah Anda merasa lelah sepanjang waktu?",
    "Apakah Anda merasakan tidak nyaman di perut?",
    "Apakah Anda mudah lelah?"
  ].freeze

  # Ambang Kemenkes untuk indikasi gangguan mental emosional: 6 "ya" atau lebih.
  CUTOFF = 6
  # Jawaban "ya" pada butir ini selalu perlu perhatian, berapa pun skornya.
  SUICIDAL_THOUGHT_ITEM = 17

  RISK_LABELS = {
    "urgent" => "Perlu Perhatian Segera",
    "follow_up" => "Perlu Tindak Lanjut",
    "below_cutoff" => "Di Bawah Ambang"
  }.freeze

  belongs_to :user
  belongs_to :followed_up_by, class_name: "User", optional: true

  serialize :answers, coder: JSON
  encrypts :answers, :follow_up_note

  validates :screened_on, presence: true, uniqueness: { scope: :user_id, message: "sudah terisi hari ini" }
  validates :consented_at, presence: { message: "wajib disetujui sebelum mengirim" }
  validate :all_questions_answered

  scope :recent, -> { order(screened_on: :desc, id: :desc) }

  after_create_commit :notify_program_heads, if: :needs_follow_up?

  def total_score
    Array(answers).count(true)
  end

  def urgent?
    Array(answers)[SUICIDAL_THOUGHT_ITEM - 1] == true
  end

  def needs_follow_up?
    urgent? || total_score >= CUTOFF
  end

  def risk_level
    return "urgent" if urgent?

    needs_follow_up? ? "follow_up" : "below_cutoff"
  end

  def risk_label
    RISK_LABELS.fetch(risk_level)
  end

  def followed_up?
    followed_up_at.present?
  end

  def record_follow_up!(by:, note:)
    update!(followed_up_at: Time.current, followed_up_by: by, follow_up_note: note)
  end

  private

  def all_questions_answered
    return if answers.is_a?(Array) && answers.size == QUESTIONS.size && answers.all? { |answer| [ true, false ].include?(answer) }

    errors.add(:answers, "semua pertanyaan wajib dijawab")
  end

  # Isinya sengaja umum, tanpa nama atau skor: notifikasi juga terkirim sebagai
  # Web Push yang bisa tampil di layar kunci ponsel kaprodi.
  def notify_program_heads
    return if user.study_program_id.nil?

    title = urgent? ? "Hasil SRQ perlu perhatian segera" : "Ada hasil SRQ yang perlu ditinjau"
    heads = User.where(study_program_id: user.study_program_id).where.not(id: user_id)
                .where(id: UserRole.joins(:role).where(roles: { code: "kaprodi" }).select(:user_id))
    heads.find_each do |head|
      Notification.notify!(recipient: head, title: title, message: "Buka menu Monitoring SRQ untuk melihat rinciannya.")
    end
  end
end
