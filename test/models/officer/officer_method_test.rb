require 'test_helper'

class OfficerMethodTest < ActiveSupport::TestCase

  context "Given context" do
    setup do 
      create_units
      create_officers
    end

    should "shows name as last, first name" do
      assert_equal "Blake, John", @jblake.name
    end   
    
    should "shows proper name as first and last name" do
      assert_equal "John Blake", @jblake.proper_name
    end 

    should "shows that Jim Gordon's ssn is stripped of non-digits" do
      assert_equal "064230511", @jgordon.ssn
    end

    should "have make_active and make_inactive methods" do
      assert @jblake.active
      @jblake.make_inactive
      @jblake.reload
      deny @jblake.active
      @jblake.make_active
      @jblake.reload
      assert @jblake.active
    end

    should "show that current_assignments for officer with no assignments is nil" do
      create_crimes
      create_investigations
      create_assignments
      assert_nil @jgordon.current_assignments  # never had an assignment
      assert_nil @msawyer.current_assignments  # old assignment finished
    end

    should "return current_assignments for officer with assignments" do
      create_crimes
      create_investigations
      create_assignments
      assert_equal [@lacey_jblake], @jblake.current_assignments  # had two assignments; one finished and one current
      assert_equal [@harbor_jazeveda], @jazeveda.current_assignments  # only has one (current) assignment ever
    end

    should "have methods to indicate roles" do
      assert @jblake.officer_role?
      deny @jblake.chief_role?
      deny @jblake.commish_role?
      assert @jgordon.commish_role?
      deny @jgordon.officer_role?
      deny @jgordon.chief_role?
      assert @msawyer.chief_role?
      deny @msawyer.commish_role?
      deny @msawyer.officer_role?
    end

  end
end
