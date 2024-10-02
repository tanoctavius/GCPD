require 'test_helper'

class SuspectScopeTest < ActiveSupport::TestCase
 # Context
  context "Within context" do
    setup do
      create_criminals
      create_investigations
      create_suspects
    end

    should "have an alphabetical scope for ordering" do
      assert_equal [@pussyfoot_catwoman, @pussyfoot_maroni, @lacey_joker], Suspect.alphabetical.to_a
    end

    should "have an chronological scope for ordering" do
      assert_equal [@pussyfoot_maroni, @pussyfoot_catwoman, @lacey_joker], Suspect.chronological.to_a
    end

    should "have a current scope for identifying current suspects" do
      assert_equal [@pussyfoot_catwoman, @lacey_joker], Suspect.current.to_a.sort_by{|s| s.added_on}
    end
  end
end
