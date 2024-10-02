require 'test_helper'

class AssignmentMethodTest < ActiveSupport::TestCase
  # Context
  context "Within context" do
    setup do
      create_units
      create_crimes
      create_officers
      create_investigations
      create_assignments
    end

    should "have a method to terminate an assignment" do
      assert @harbor_jazeveda.end_date.nil?
      @harbor_jazeveda.terminate
      @harbor_jazeveda.reload
      deny @harbor_jazeveda.end_date.nil?
    end

    should "never be destroyed" do
      deny @pussyfoot_jblake.destroy
    end

  end
end