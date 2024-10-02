require 'test_helper'

class InvestigationTest < ActiveSupport::TestCase
  # Relationship matchers
  should have_many(:crime_investigations)
  should have_many(:crimes).through(:crime_investigations)
  should have_many(:suspects)
  should have_many(:criminals).through(:suspects)
  should have_many(:investigation_notes)
  should have_many(:assignments)
  should have_many(:officers).through(:assignments)

  # Validation matchers
  should validate_presence_of(:title)
  should validate_presence_of(:date_opened)
  should allow_value(Date.current).for(:date_opened)
  should allow_value(1.day.ago.to_date).for(:date_opened)
  should_not allow_value(1.day.from_now.to_date).for(:date_opened)
  should_not allow_value("bad").for(:date_opened)
  should_not allow_value(2).for(:date_opened)
  should_not allow_value(3.14159).for(:date_opened) 
  should_not allow_value(nil).for(:date_opened)

  # Context
  context "Within context" do
    setup do
      create_crimes
      create_investigations
    end

    should "validate date closed cannot precede date opened but can equal it" do
      assert @pussyfoot.date_opened < @pussyfoot.date_closed
      @pussyfoot.date_closed = 3.years.ago.to_date
      deny @pussyfoot.date_opened < @pussyfoot.date_closed
      deny @pussyfoot.valid?
      @pussyfoot.date_closed = @pussyfoot.date_opened
      assert @pussyfoot.valid?
    end

    should "validate date closed can be nil" do
      assert @harbor.date_closed.nil?
    end

    should "never be destroyed" do
      deny @pussyfoot.destroy  # can't destroy a closed investigation
      deny @harbor.destroy     # can't destroy an open investigation
    end

  end
end
