class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Batas bawah mengikuti dukungan Tailwind CSS v4 (Safari 16.4, Chrome 111,
  # Firefox 128) — di bawahnya tampilan memang rusak. Bukan preset :modern
  # Rails (Safari 17.2+): itu menolak iPhone 8/X yang mentok di iOS 16, padahal
  # masih banyak dipakai mahasiswa. Peramban tak dikenal (Samsung Internet,
  # Edge, webview aplikasi) tetap diizinkan.
  allow_browser versions: { safari: 16.4, chrome: 111, firefox: 128, opera: 97, ie: false }, unless: :open_to_any_browser?

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # Setiap parameter query di aplikasi ini bernilai tunggal — nomor halaman
  # Kaminari, id (student_id, academic_period_id, …), kata kunci pencarian,
  # filter peran. Dikirim sebagai array/hash (?page[]=1, ?student_id[a]=1,
  # ?role[a]=1) nilainya membuat .to_i / .gsub / User.find / has_role? / where
  # gagal → galat 500 di hampir semua halaman. Tidak ada tautan atau form GET
  # yang sah mengirimnya begitu; bila kelak ada, kecualikan namanya di sini.
  prepend_before_action :reject_non_scalar_query_params
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :require_password_change, unless: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  around_action :switch_locale

  helper_method :unread_notifications_count, :latest_notifications, :viewed_student, :viewing_other_student?, :student_scope_params

  protected

  # Halaman asesmen mahasiswa (Evaluasi Akademik, Peta Kompetensi, Jurnal,
  # dsb.) bisa dibuka pengajar/kaprodi untuk mahasiswa lain lewat
  # ?student_id= (hanya-baca; pintu masuknya Dasbor Mahasiswa). Tanpa
  # parameter itu, atau bagi mahasiswa, selalu diri sendiri. Pengajar/kaprodi
  # yang menunjuk akun bukan-mahasiswa atau mahasiswa di luar prodi binaannya
  # (kaprodi) ditolak, bukan diam-diam dialihkan ke dirinya sendiri.
  def viewed_student
    @viewed_student ||= if params[:student_id].present? && current_user.can_view_students?
      student = User.find(params[:student_id])
      raise Pundit::NotAuthorizedError unless current_user.can_view_student?(student)

      student
    else
      current_user
    end
  end

  def viewing_other_student?
    viewed_student != current_user
  end

  # Parameter yang harus dibawa tautan antar-halaman mahasiswa supaya
  # konteks "melihat mahasiswa lain" tidak hilang di tengah jalan.
  def student_scope_params
    viewing_other_student? ? { student_id: viewed_student.id } : {}
  end

  # Bahasa antarmuka: preferensi akun bila sudah login, lalu cookie (dipakai
  # halaman Devise sebelum login — cookie, bukan session, karena sign-out
  # Devise membuang session), lalu bawaan aplikasi (:id).
  def switch_locale(&action)
    locale = user_signed_in? ? current_user.locale_preference : cookies[:locale]
    locale = I18n.default_locale unless User::LOCALE_OPTIONS.include?(locale.to_s)
    I18n.with_locale(locale, &action)
  end

  # Dipakai topbar (lonceng notifikasi) di setiap halaman yang sudah login —
  # dihitung di sini, bukan tiap view, supaya query-nya satu tempat.
  def unread_notifications_count
    return 0 unless user_signed_in?

    current_user.notifications.unread.active.count
  end

  def latest_notifications
    return Notification.none unless user_signed_in?

    current_user.notifications.active.recent.limit(5)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :full_name, :role_code ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :full_name ])
  end

  private

  # Halaman yang harus terbuka walau perambannya lama; lihat
  # Public::PatientConsentsController.
  def open_to_any_browser?
    false
  end

  def reject_non_scalar_query_params
    # nil = kunci tanpa nilai (?unduh) — tetap skalar.
    return if request.query_parameters.each_value.all? { |value| value.nil? || value.is_a?(String) }

    raise ActionController::BadRequest, "Parameter query tidak valid"
  end

  # Akun berkata sandi sementara (impor CSV / reset admin) atau yang masih
  # memakai kata sandi bawaan lama hanya boleh membuka Pengaturan Akun (Devise
  # registrations#edit) sampai kata sandinya diganti — controller Devise
  # (termasuk keluar) tidak tersentuh filter ini.
  def require_password_change
    return unless user_signed_in? && current_user.must_change_password?

    redirect_to edit_user_registration_path, alert: "Ganti kata sandi sementara Anda terlebih dahulu sebelum melanjutkan."
  end

  def user_not_authorized
    flash[:alert] = "Anda tidak memiliki akses untuk melakukan itu."
    redirect_back fallback_location: root_path
  end
end
