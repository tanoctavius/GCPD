require 'test_helper'

class CrimeInvestigationScopeTest < ActiveSupport::TestCase
  # Context
  context "Within context" do
    setup do
      create_crimes
      create_investigations
      create_crime_investigations
    end

    should "have a scope for_crime passing in a crime object" do
      assert_equal [@lacey], CrimeInvestigation.for_crime(@murder).map{|ci| ci.investigation }
    end

    should "have a scope for_investigation passing in an investigation object" do
      assert_equal [@murder], CrimeInvestigation.for_investigation(@lacey).map{|ci| ci.crime }
      assert_equal 2, CrimeInvestigation.for_investigation(@pussyfoot).count
    end
  end
end
