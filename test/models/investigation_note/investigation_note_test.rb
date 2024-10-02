require 'test_helper'

class InvestigationNoteTest < ActiveSupport::TestCase
  # Relationship matchers
  should belong_to(:investigation)
  should belong_to(:officer)

  # Validation matchers
  should validate_presence_of(:investigation_id)
  should validate_presence_of(:officer_id)
  should validate_presence_of(:content)

  # Context
  context "Within context" do
    setup do
      create_units
      create_officers
      create_investigations
      create_assignments
      create_investigation_notes
    end

    should "not allow a new note on a closed case" do
      closed_case = FactoryBot.build(:investigation_note, investigation: @pussyfoot, officer: @msawyer)
      deny closed_case.valid?
    end

    should "not allow a note by unassigned officer" do
      not_assigned = FactoryBot.build(:investigation_note, investigation: @lacey, officer: @msawyer)
      deny not_assigned.valid?
    end

    should "set the date of the note to current date by default" do
      no_date = FactoryBot.create(:investigation_note, date: nil, investigation: @lacey, officer: @jblake)
      no_date.reload
      assert_equal Date.current, no_date.date
    end

    should "never be destroyed" do
      deny @pussyfoot_note_1.destroy
    end
  end
end
