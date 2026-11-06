# frozen_string_literal: true

# Skrining mandiri SRQ-20. Hanya jawaban yang disimpan, dan terenkripsi; skor
# dan kategori diturunkan darinya (SrqScreening), supaya tidak ada data
# kesehatan mental berbentuk teks biasa di basis data.
class CreateSrqScreenings < ActiveRecord::Migration[8.1]
  def change
    create_table :srq_screenings do |t|
      t.references :user, null: false, foreign_key: true, index: false
      t.date :screened_on, null: false
      t.text :answers, null: false
      t.datetime :consented_at, null: false
      t.datetime :followed_up_at
      t.references :followed_up_by, foreign_key: { to_table: :users }
      t.text :follow_up_note

      t.timestamps
    end

    add_index :srq_screenings, %i[user_id screened_on], unique: true
  end
end
