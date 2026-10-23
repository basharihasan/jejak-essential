# frozen_string_literal: true

# Validasi tipe, ukuran, dan jumlah lampiran Active Storage — Rails tidak
# menyediakannya. Tipe dibaca dari isi berkas (Active Storage mengidentifikasi
# lewat Marcel saat lampiran dibuat), bukan dari ekstensi kiriman peramban.
#
# Hanya lampiran BARU yang diperiksa tipe & ukurannya: lampiran lama yang
# terunggah sebelum aturan ini ada tidak boleh membuat rekamannya tak bisa
# disunting lagi. Jumlah dihitung dari seluruh lampiran.
module AttachmentValidation
  extend ActiveSupport::Concern

  IMAGE_TYPES = %w[image/jpeg image/png image/webp image/gif image/heic image/heif].freeze
  WEB_IMAGE_TYPES = %w[image/jpeg image/png image/webp image/gif].freeze
  DOCUMENT_TYPES = %w[
    application/pdf
    application/msword
    application/vnd.openxmlformats-officedocument.wordprocessingml.document
    application/vnd.ms-powerpoint
    application/vnd.openxmlformats-officedocument.presentationml.presentation
    application/vnd.ms-excel
    application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  ].freeze

  # Label ramah untuk pesan galat & atribut accept= di form.
  TYPE_LABELS = { IMAGE_TYPES => "gambar (JPG/PNG/WebP/HEIC)", WEB_IMAGE_TYPES => "gambar (JPG/PNG/WebP/GIF)",
                  DOCUMENT_TYPES => "PDF/Word/PowerPoint/Excel" }.freeze

  class_methods do
    def validates_attachments(name, content_types:, max_size:, max_count: nil)
      attachment_rules[name] = { content_types: content_types, max_size: max_size, max_count: max_count }

      validate do
        attached = public_send(name)
        attachments = attached.is_a?(ActiveStorage::Attached::Many) ? attached.attachments.to_a : [ attached.attachment ].compact
        rule = self.class.attachment_rules.fetch(name)

        added = attachments.select(&:new_record?)
        if rule[:max_count] && added.any? && attachments.size > rule[:max_count]
          errors.add(name, "maksimal #{rule[:max_count]} berkas")
        end

        added.each do |attachment|
          blob = attachment.blob
          unless rule[:content_types].include?(blob.content_type)
            errors.add(name, "#{blob.filename}: jenis berkas tidak didukung — hanya #{self.class.attachment_types_label(name)}")
          end
          if blob.byte_size > rule[:max_size]
            errors.add(name, "#{blob.filename}: ukuran maksimal #{ActiveSupport::NumberHelper.number_to_human_size(rule[:max_size])}")
          end
        end
      end
    end

    def attachment_rules
      @attachment_rules ||= {}
    end

    # Nilai atribut accept= untuk <input type="file"> agar pemilih berkas
    # peramban langsung menyaring jenis yang diterima.
    def attachment_accept(name)
      attachment_rules.fetch(name)[:content_types].join(",")
    end

    def attachment_types_label(name)
      types = attachment_rules.fetch(name)[:content_types]
      TYPE_LABELS.filter_map { |group, label| label if (group & types).any? }.join(" atau ")
    end

    def attachment_max_size_label(name)
      ActiveSupport::NumberHelper.number_to_human_size(attachment_rules.fetch(name)[:max_size])
    end
  end
end
