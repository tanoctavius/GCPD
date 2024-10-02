require 'test_helper'

class CriminalDeletionTest < ActiveSupport::TestCase
# Context
  context "Within context" do
    setup do
      create_criminals
    end

    should "not be able remove convicted felons" do
      deny @catwoman.destroy 
    end

    should "not be able remove people with enhanced powers" do
      deny @bane.destroy 
    end

    should "not be able remove current suspects" do
      create_investigations
      create_suspects
      deny @joker.destroy
    end

    should "be able remove otherwise innocent people" do
      create_investigations
      create_suspects
      # Harry Mudd is a villian from Star Trek and not a criminal in Gotham City; may not be innocent in the Federation, but fine with GCPD
      mudd = FactoryBot.create(:criminal, first_name: "Harcourt", last_name: "Mudd", aka: "Harry", convicted_felon: false, enhanced_powers: false)  
      assert_equal 0, mudd.suspects.size # not a suspect in any investigation
      assert mudd.destroy
    end

    should "be able remove criminals who are dropped suspects" do
      create_investigations
      create_suspects

      # dropped suspect on closed investigation
      assert_equal 1, @maroni.suspects.size
      assert Suspect.exists?(@pussyfoot_maroni.id)
      assert @maroni.destroy
      deny Suspect.exists?(@pussyfoot_maroni.id)

      # dropped suspect on open investigation
      green = FactoryBot.create(:criminal, first_name: "Gia", last_name: "Green", aka: "Gia")  
      harbor_green = FactoryBot.create(:suspect, investigation: @harbor, criminal: green, added_on: 19.months.ago.to_date, dropped_on: 18.months.ago.to_date)
      assert green.destroy
      deny Suspect.exists?(harbor_green.id)

    end

    should "be able remove criminals who are a part of closed investigations" do
      create_investigations
      create_suspects
      
      # current suspect on closed investigation
      green = FactoryBot.create(:criminal, first_name: "Gia", last_name: "Green", aka: "Gia")  
      pussyfoot_green = FactoryBot.create(:suspect, investigation: @pussyfoot, criminal: green, added_on: 19.months.ago.to_date, dropped_on: nil)
      assert_equal 1, green.suspects.size
      assert green.destroy
      deny Suspect.exists?(pussyfoot_green.id)

      # dropped suspect on closed investigation
      blue = FactoryBot.create(:criminal, first_name: "Bea", last_name: "Blue", aka: "Bea")  
      pussyfoot_blue = FactoryBot.create(:suspect, investigation: @pussyfoot, criminal: blue, added_on: 19.months.ago.to_date, dropped_on: 19.months.ago.to_date)
      assert_equal 1, blue.suspects.size
      assert blue.destroy
      deny Suspect.exists?(pussyfoot_blue.id)
    end

  end
end
