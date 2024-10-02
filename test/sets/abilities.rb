module Contexts
  module Abilities

    def create_commish_abilities
      create_units
      @jgordon  = FactoryBot.create(:officer, first_name: "Jim", last_name: "Gordon", rank: "Commissioner", role: "commish", username:"jgordon", unit: @headquarters)
      @jgordon_ability = Ability.new(@jgordon)
    end

    def create_chief_abilities
      # created related objects for testing
      create_crimes
      create_units
      # create chief and her abilities
      @msawyer  = FactoryBot.create(:officer, first_name: "Maggie", last_name: "Sawyer", rank: "Captain", role: "chief", username: "msawyer", unit: @major_crimes)
      @msawyer_ability = Ability.new(@msawyer)
      # create other officers
      @jblake   = FactoryBot.create(:officer, unit: @major_crimes, role: "officer")
      @jgordon  = FactoryBot.create(:officer, first_name: "Jim", last_name: "Gordon", rank: "Commissioner", role: "commish", username:"jgordon", unit: @headquarters)
      @jazeveda = FactoryBot.create(:officer, first_name: "Josh", last_name: "Azeveda", rank: "Detective", role: "officer", username: "jazeveda", unit: @major_crimes)
      # create other objects for testing abilities
      create_investigations
      create_crime_investigations
      create_assignments
      create_investigation_notes
    end

    def create_officer_abilities
      # created related objects for testing
      create_crimes
      create_units
      # create officer and his abilities
      @jblake   = FactoryBot.create(:officer, unit: @major_crimes)
      @jblake_ability = Ability.new(@jblake)
      # create other officers
      @msawyer  = FactoryBot.create(:officer, first_name: "Maggie", last_name: "Sawyer", rank: "Captain", role: "chief", username: "msawyer", unit: @major_crimes)
      @jgordon  = FactoryBot.create(:officer, first_name: "Jim", last_name: "Gordon", rank: "Commissioner", role: "commish", username:"jgordon", unit: @headquarters)
      @jazeveda = FactoryBot.create(:officer, first_name: "Josh", last_name: "Azeveda", rank: "Detective", role: "officer", username: "jazeveda", unit: @major_crimes)
      # create other objects for testing abilities
      create_investigations
      create_crime_investigations
      create_assignments
      create_investigation_notes
    end

  end
end