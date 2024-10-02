require 'test_helper'

class InvestigationNoteScopeTest < ActiveSupport::TestCase
  # Context
  context "Within context" do
    setup do
      create_units
      create_officers
      create_investigations
      create_assignments
      create_investigation_notes
    end

    should "have an chronological scope for ordering" do
      assert_equal [@pussyfoot_note_1, @pussyfoot_note_2, @lacey_note_1], InvestigationNote.chronological.to_a
    end

    should "have a by_officer scope for ordering alphabetically by officer" do
      assert_equal [@lacey_note_1, @pussyfoot_note_1, @pussyfoot_note_2], InvestigationNote.by_officer.to_a
    end

    should "have a for_officer scope for retrieving notes by an officer" do
      assert_equal [@pussyfoot_note_2], InvestigationNote.for_officer(@msawyer).to_a
      assert_equal [@pussyfoot_note_1, @lacey_note_1], InvestigationNote.for_officer(@jblake).to_a.sort_by{|n| n.date}
    end

  end
end
