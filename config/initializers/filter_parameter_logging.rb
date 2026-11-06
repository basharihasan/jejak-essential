# Be sure to restart your server when you modify this file.

# Configure parameters to be partially matched (e.g. passw matches password) and filtered from the log file.
# Use this to limit dissemination of sensitive information.
# See the ActiveSupport::ParameterFilter documentation for supported notations and behaviors.
#
# Kolom `encrypts` tersaring otomatis, tetapi hanya dengan awalan modelnya
# (patient_consent.signer_name). Lembar persetujuan publik mengirim
# `signer_name` tanpa awalan, jadi harus disebut di sini.
Rails.application.config.filter_parameters += [
  :passw, :email, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn, :cvv, :cvc, :signer_name
]

# Jawaban SRQ dan catatan tindak lanjutnya adalah data kesehatan.
Rails.application.config.filter_parameters += [ :srq_answers, :follow_up_note ]
