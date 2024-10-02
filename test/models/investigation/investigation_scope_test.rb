require 'test_helper'

class InvestigationScopeTest < ActiveSupport::TestCase

  context "Given context" do
    setup do 
      create_crimes
      create_investigations
      create_units
      create_officers
      create_assignments
    end

    should "have an alphabetical scope for ordering" do
      assert_equal [@harbor, @lacey, @pussyfoot], Investigation.alphabetical.to_a
    end

    should "have an chronological scope for ordering" do
      assert_equal [@pussyfoot, @harbor, @lacey], Investigation.chronological.to_a
    end

    should "have an is_open scope to find open cases" do
      assert_equal [@harbor, @lacey], Investigation.is_open.to_a.sort_by{|i| i.date_opened}
    end

    should "have an is_closed scope to find closed cases" do
      assert_equal [@pussyfoot], Investigation.is_closed.to_a
    end

    should "have an open_on_date scope to find open cases for a particular day in the past" do
      assert_equal [@harbor], Investigation.open_on_date(2.weeks.ago).to_a
      assert_equal [@pussyfoot], Investigation.open_on_date(19.months.ago).to_a
    end

    should "have an with_batman scope to find cases Batman helped with" do
      assert_equal [@pussyfoot], Investigation.with_batman.to_a
    end

    should "have an was_solved scope to find solved cases" do
      assert_equal [@pussyfoot], Investigation.was_solved.to_a
    end

    should "have an unsolved scope to find unsolved cases" do
      assert_equal [@harbor, @lacey], Investigation.unsolved.to_a.sort_by{|i| i.date_opened}
    end

    should "have an unassigned scope to find unassigned cases" do
      # creating example unassigned investigations within the test so they do not interfere with other tests 
      @murder  = FactoryBot.create(:investigation, title: "A Murder in Gotham City", description: "A brutal murder", date_opened: 2.months.ago.to_date, date_closed: nil, solved: false, batman_involved: true)
      @fire    = FactoryBot.create(:investigation, title: "A Fire in Gotham City", description: "A devastating fire", date_opened: 5.months.ago.to_date, date_closed: 1.month.ago.to_date, solved: true)
      assert_equal [@fire, @murder], Investigation.unassigned.to_a.sort_by{|i| i.date_opened}
    end

    should "have an title_search scope to find cases by title" do
      @murder  = FactoryBot.create(:investigation, title: "A Murder in Gotham City", description: "A brutal murder", date_opened: 1.months.ago.to_date, date_closed: nil, solved: false, batman_involved: true)
      assert_equal [@harbor, @murder], Investigation.title_search("tha").to_a.sort_by{|i| i.date_opened}
    end

  end
end