require "test_helper"

class AssessmentBlueprintTest < ActiveSupport::TestCase
  test "lengkap ketika bobot mapping kompetensi berjumlah 100" do
    blueprint = AssessmentBlueprint.create!(name: "Blueprint Baru")
    blueprint.assessment_blueprint_mappings.create!(competency_item: competency_items(:domain_klinis), weight: 60)
    blueprint.assessment_blueprint_mappings.create!(competency_item: competency_items(:domain_komunikasi), weight: 40)

    assert blueprint.valid?
    assert blueprint.weights_complete?
  end

  # Mapping ditambah satu per satu — selama penyusunan total belum 100%, dan
  # itu tidak boleh mengunci sunting nama/deskripsi blueprint.
  test "bobot belum 100 ditandai belum lengkap tapi blueprint tetap bisa disunting" do
    blueprint = AssessmentBlueprint.create!(name: "Blueprint Baru")
    blueprint.assessment_blueprint_mappings.create!(competency_item: competency_items(:domain_klinis), weight: 60)
    blueprint.assessment_blueprint_mappings.create!(competency_item: competency_items(:domain_komunikasi), weight: 30)

    assert_not blueprint.weights_complete?
    assert_equal 10.0, blueprint.remaining_weight
    assert blueprint.update(name: "Blueprint Diganti")
  end

  test "mapping yang mendorong total melewati 100 ditolak" do
    blueprint = AssessmentBlueprint.create!(name: "Blueprint Baru")
    blueprint.assessment_blueprint_mappings.create!(competency_item: competency_items(:domain_klinis), weight: 70)
    mapping = blueprint.assessment_blueprint_mappings.new(competency_item: competency_items(:domain_komunikasi), weight: 40)

    assert_not mapping.save
    assert mapping.errors[:weight].any? { |m| m.include?("tersisa 30.0%") }
    assert_equal 70.0, blueprint.reload.total_weight
  end

  test "menyunting bobot mapping yang sudah ada tidak menghitung dirinya dua kali" do
    mapping = assessment_blueprint_mappings(:osce_klinis) # 60 + 40 = 100

    assert mapping.update(weight: 60), mapping.errors.full_messages.to_sentence
    assert_not mapping.update(weight: 61)
  end

  test "boleh tanpa peta kompetensi sama sekali" do
    blueprint = AssessmentBlueprint.new(name: "Blueprint Draf")
    assert blueprint.valid?
  end

  test "total_weight menjumlahkan seluruh bobot mapping" do
    blueprint = assessment_blueprints(:osce_blueprint)
    assert_equal 100.0, blueprint.total_weight
  end

  test "weight_by_competency_item mengembalikan hash CompetencyItem ke bobot" do
    blueprint = assessment_blueprints(:osce_blueprint)
    weights = blueprint.weight_by_competency_item

    assert_equal 60.0, weights[competency_items(:domain_klinis)]
    assert_equal 40.0, weights[competency_items(:domain_komunikasi)]
  end
end
