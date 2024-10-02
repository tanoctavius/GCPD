require 'test_helper'

class CrimeScopeTest < ActiveSupport::TestCase

  context "Given context" do
    setup do 
      create_crimes
    end

    should "have active and inactive scopes" do
      assert_equal 4, Crime.active.count
      assert_equal [@arson, @murder, @robbery, @trespass], Crime.active.to_a.sort_by{|c| c.name}
      assert_equal 1, Crime.inactive.count
      assert_equal [@murder2], Crime.inactive.to_a
    end

    should "have an alphabetical scope for ordering" do
      assert_equal [@arson, @murder, @murder2, @robbery, @trespass], Crime.alphabetical.to_a
    end

    should "have a felonies scope" do
      assert_equal 4, Crime.felonies.count
      assert_equal [@arson, @murder, @murder2, @robbery], Crime.felonies.to_a.sort_by{|c| c.name}
    end

    should "have a misdemeanors scope" do
      assert_equal 1, Crime.misdemeanors.count
      assert_equal [@trespass], Crime.misdemeanors.to_a
    end


  end
end