require 'test_helper'

class AssignmentScopeTest < ActiveSupport::TestCase

  context "Given context" do
    setup do 
      create_units
      create_officers
      create_crimes
      create_investigations
      create_assignments
    end

    should "show that there are two assignments that are current" do
      assert_equal [@harbor_jazeveda, @lacey_jblake], Assignment.current.to_a.sort_by{|a| a.start_date}
    end    
    
    should "show that there are two assignments that are past" do
      assert_equal [@pussyfoot_jblake, @pussyfoot_msawyer], Assignment.past.to_a.sort_by{|a| a.start_date}
    end

    should "order assignments chronologically by start date" do
      assert_equal [@pussyfoot_jblake, @pussyfoot_msawyer, @harbor_jazeveda, @lacey_jblake], Assignment.chronological.to_a
    end

    should "order assignments alphabetically by officer name" do
      assert_equal [@harbor_jazeveda, @lacey_jblake, @pussyfoot_jblake, @pussyfoot_msawyer], Assignment.by_officer.to_a
    end

    should "show that there are two assignments for the date of 1/1/2024" do
      assert_equal [@harbor_jazeveda, @lacey_jblake], Assignment.for_date(3.weeks.ago.to_date).to_a.sort_by{|a| a.start_date}
    end


  end
end