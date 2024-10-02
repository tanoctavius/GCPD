require 'test_helper'

class CriminalScopeTest < ActiveSupport::TestCase

  # Context
  context "Within context" do
    setup do
      create_criminals
    end

    should "have an alphabetical scope for ordering" do
      assert_equal [@bane, @catwoman, @maroni, @joker], Criminal.alphabetical.to_a
    end

    should "have a prior_record scope for those convicted of crime" do
      assert_equal [@bane, @catwoman], Criminal.prior_record.to_a.sort_by{|c| c.last_name}
    end

    should "have an enhanced scope for those with enhanced powers" do
      assert_equal [@bane], Criminal.enhanced.to_a
    end

    should "have a search scope that searches names and aliases" do
      assert_equal [@catwoman], Criminal.search("kyle").to_a
      assert_equal [@joker], Criminal.search("jok").to_a
      assert_equal [@joker], Criminal.search("jack").to_a
      assert_equal [@maroni], Criminal.search("sal").to_a
      # ensure that searching not from the start does not yield anything
      assert_equal [], Criminal.search("ina").to_a
      assert_equal [], Criminal.search("yl").to_a
      assert_equal [], Criminal.search("wo").to_a
    end

  end
end
