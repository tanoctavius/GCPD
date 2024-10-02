require 'test_helper'

class InvestigationMethodTest < ActiveSupport::TestCase
  # Context
  context "Within context" do
    setup do
      create_crimes
      create_investigations
      create_units
      create_officers
      create_assignments
    end

    should "end assignments of closed investigations" do
      assert_equal 1, @harbor.assignments.current.count
      assert_nil @harbor.date_closed
      @harbor.date_closed = Date.current
      @harbor.save
      @harbor.reload
      assert_not_nil @harbor.date_closed
      assert_equal 0, @harbor.assignments.current.count
    end

    should "not end assignments of investigations are opened but have been edited" do
      assert_equal 1, @lacey.assignments.current.count
      @lacey.title = "The Double Killings at Lacey Towers"
      @lacey.save
      @lacey.reload
      assert_equal "The Double Killings at Lacey Towers", @lacey.title
      assert_equal 1, @lacey.assignments.current.count
    end

    should "never be destroyed" do
      deny @pussyfoot.destroy
    end

    should "have a method to close an investigation" do
      assert_equal 1, @harbor.assignments.current.count
      assert_nil @harbor.date_closed
      @harbor.close
      @harbor.reload
      assert_not_nil @harbor.date_closed
      assert_equal 0, @harbor.assignments.current.count
    end
  end
end
