require 'test_helper'

class OfficerDeletionTest < ActiveSupport::TestCase
# Context
  context "Within context" do
    setup do
      create_units
      create_officers
    end

    should "be able destroy officers without assignments" do
      create_investigations
      create_assignments
      assert @jgordon.destroy
    end

    should "not destroy officers with assignments" do
      create_investigations
      create_assignments
      # Blake and Sawyer are active now
      assert @jblake.active
      assert @msawyer.active
      # assert that Blake has current assignments; Sawyer has past assignments only
      deny @jblake.assignments.current.empty?
      assert @msawyer.assignments.current.empty?
      deny @msawyer.assignments.empty?
      # attempt to destroy fails
      deny @jblake.destroy  # has current assignments
      deny @msawyer.destroy  # has only past assignments
      @jblake.reload
      @msawyer.reload
      # verify now inactive
        # deny @jblake.active
        # deny @msawyer.active
      # verify no current assignments for Blake
        # assert @jblake.assignments.current.empty?
    end

    should "not be made inactive for a bad edit" do
      assert @jblake.active
      @jblake.last_name = nil
      deny @jblake.valid?
      deny @jblake.save
      assert @jblake.active
    end

    should "terminate assignments of inactive officers" do
      create_investigations
      create_assignments
      assert_equal 1, @jblake.assignments.current.count
      @jblake.make_inactive
      @jblake.reload
      deny @jblake.active
      assert_equal 0, @jblake.assignments.current.count
    end
  end
end
