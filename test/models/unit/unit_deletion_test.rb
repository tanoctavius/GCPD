require 'test_helper'

class UnitDeletionTest < ActiveSupport::TestCase
  # Context
  context "Within context" do
    setup do
      create_units
    end

    should "not be able destroy units with officers assigned" do
      create_officers
      deny @major_crimes.destroy  
    end

    should "be able destroy units without officers assigned" do
      create_officers
      assert @homicide.destroy
    end

  end
end
