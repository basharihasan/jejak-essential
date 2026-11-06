# frozen_string_literal: true

# Satu percobaan asesmen beserta dokumen dan evaluasi dirinya. Boleh dibuka
# pemiliknya, penguji yang ditugaskan, admin, serta pengajar dan kaprodi yang
# boleh membuka mahasiswa itu (User#can_view_student?: kaprodi hanya prodi
# binaannya).
class AssessmentInstancePolicy < ApplicationPolicy
  def show?
    record.student_id == user.id || record.examiner_id == user.id ||
      user.has_role?("admin") || user.can_view_student?(record.student)
  end
end
