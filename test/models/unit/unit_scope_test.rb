require 'test_helper'

class UnitScopeTest < ActiveSupport::TestCase

  context "Given context" do
    setup do 
      create_units
    end

    should "have active and inactive scopes" do
      assert_equal 3, Unit.active.count
      assert_equal [@headquarters, @homicide, @major_crimes], Unit.active.to_a.sort_by{|u| u.name}
      assert_equal 1, Unit.inactive.count
      assert_equal [@section_31], Unit.inactive.to_a
    end

    should "have an alphabetical scope for ordering" do
      assert_equal [@headquarters, @homicide, @major_crimes, @section_31], Unit.alphabetical.to_a
    end

  end
end