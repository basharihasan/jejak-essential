require "application_system_test_case"

class ClinicalCaseWizardDotsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "klik penanda langkah melompat langsung ke langkah itu" do
    sign_in users(:siti)
    visit new_clinical_case_path

    assert_text "LANGKAH 1 DARI 6"
    # aria-current dipasang oleh Stimulus saat connect — tunggu itu dulu supaya
    # klik tidak mendahului pemuatan JS (pernah gagal acak di CI).
    assert_selector '[data-wizard-target="dot"][aria-current="step"][data-wizard-index-param="0"]'
    find('[data-wizard-target="dot"][data-wizard-index-param="3"]').click
    assert_text "LANGKAH 4 DARI 6"
    assert_selector '[data-wizard-target="dot"][aria-current="step"][data-wizard-index-param="3"]'

    find('[data-wizard-target="dot"][data-wizard-index-param="0"]').click
    assert_text "LANGKAH 1 DARI 6"
  end

  test "klik penanda langkah tidak menggulir halaman" do
    sign_in users(:siti)
    visit new_clinical_case_path
    assert_selector '[data-wizard-target="dot"][aria-current="step"][data-wizard-index-param="0"]'

    # Guliran menggeser penanda dari bawah kursor, sehingga klik berikutnya
    # mendarat di elemen lain tanpa galat (pernah gagal acak di CI). Panggilannya
    # dicegat karena guliran halus belum tampak di scrollY saat asersi berjalan.
    page.execute_script("window.__scrolls = 0; Element.prototype.scrollIntoView = () => window.__scrolls++")
    find('[data-wizard-target="dot"][data-wizard-index-param="3"]').click
    assert_text "LANGKAH 4 DARI 6"

    assert_equal 0, page.evaluate_script("window.__scrolls")
  end

  test "penanda langkah tidak tertutup header saat wizard digulir ke awal" do
    sign_in users(:siti)
    visit new_clinical_case_path
    assert_selector '[data-wizard-target="dot"][aria-current="step"][data-wizard-index-param="0"]'

    # Tombol Lanjut/Sebelumnya menggulir kartu wizard ke atas layar — penanda
    # harus tetap bisa diklik, tidak berada di balik header lengket.
    clickable = page.evaluate_script(<<~JS)
      (() => {
        document.querySelector('[data-controller="wizard"]').scrollIntoView({ block: "start", behavior: "instant" });
        const dot = document.querySelector('[data-wizard-target="dot"]');
        const rect = dot.getBoundingClientRect();
        return dot.contains(document.elementFromPoint(rect.x + rect.width / 2, rect.y + rect.height / 2));
      })()
    JS

    assert clickable, "penanda langkah tertutup elemen lain setelah wizard digulir ke awal"
  end
end
