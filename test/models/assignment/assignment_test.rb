require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # Relationship matchers
  should belong_to(:officer)
  should belong_to(:investigation)

  # Validation matchers
  should validate_presence_of(:officer_id)
  should validate_presence_of(:investigation_id)
  should validate_presence_of(:start_date)
  should allow_value(Date.current).for(:start_date)
  should allow_value(1.day.ago.to_date).for(:start_date)
  should_not allow_value(1.day.from_now.to_date).for(:start_date)
  should_not allow_value("bad").for(:start_date)
  should_not allow_value(2).for(:start_date)
  should_not allow_value(3.14159).for(:start_date) 
  should_not allow_value(nil).for(:start_date)

  # Context
  context "Within context" do
    setup do
      create_units
      create_crimes
      create_officers
      create_investigations
      create_assignments
    end

    should "identify a non-active officer as an invalid assignment" do
      bad_assignment_officer = FactoryBot.build(:assignment, investigation: @harbor, officer: @gloeb)
      deny bad_assignment_officer.valid?
    end

    should "identify a closed case as an invalid assignment" do
      bad_assignment_case = FactoryBot.build(:assignment, investigation: @pussyfoot, officer: @jgordon)
      deny bad_assignment_case.valid?
    end

    should "validate end date cannot precede start date but can equal it" do
      assert @pussyfoot_jblake.valid?, "PJ: #{@pussyfoot_jblake.investigation.title}"
      assert @pussyfoot_jblake.start_date < @pussyfoot_jblake.end_date
      @pussyfoot_jblake.end_date = 3.years.ago.to_date
      deny @pussyfoot_jblake.start_date < @pussyfoot_jblake.end_date
      deny @pussyfoot_jblake.valid?
      @pussyfoot_jblake.end_date = @pussyfoot_jblake.start_date
      assert @pussyfoot_jblake.valid?
    end

    should "not allow duplicate assignments if the assignment is current" do
      duplicate_assignment = FactoryBot.build(:assignment, investigation: @harbor, officer: @jazeveda)
      deny duplicate_assignment.valid?
    end

    should "allow reassignment of officer to an investigation" do
      @harbor_jazeveda.end_date = 2.weeks.ago.to_date
      @harbor_jazeveda.save
      @harbor_jazeveda.reload
      reassignment = FactoryBot.build(:assignment, investigation: @harbor, officer: @jazeveda)
      assert reassignment.valid?
    end
  end
end
