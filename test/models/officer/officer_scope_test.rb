require 'test_helper'

class OfficerScopeTest < ActiveSupport::TestCase

  context "Given context" do
    setup do 
      create_units
      create_officers
    end

    should "have active and inactive scopes" do
      assert_equal 4, Officer.active.count
      assert_equal [@jazeveda, @jblake, @jgordon, @msawyer], Officer.active.to_a.sort_by{|o| o.last_name}
      assert_equal 1, Officer.inactive.count
      assert_equal [@gloeb], Officer.inactive.to_a
    end

    should "have an alphabetical scope for ordering" do
      assert_equal [@jazeveda, @jblake, @jgordon, @gloeb, @msawyer], Officer.alphabetical.to_a
    end

    should "have a detectives scope" do
      assert_equal 2, Officer.detectives.count
      assert_equal [@jazeveda, @jblake], Officer.detectives.to_a.sort_by{|o| o.last_name}
    end

    should "have a for_unit scope that takes unit_id as parameter" do
      assert_equal 3, Officer.for_unit(@major_crimes).count
      assert_equal [@jazeveda, @jblake, @msawyer], Officer.for_unit(@major_crimes).to_a.sort_by{|o| o.last_name}
    end

    should "have a search scope that takes name fragment as parameter" do
      assert_equal 2, Officer.search("jo").count
      assert_equal [@jazeveda, @jblake], Officer.search("jo").to_a.sort_by{|o| o.last_name}
      assert_equal [@jgordon], Officer.search("go").to_a
    end

    should "have role scopes for each role in the enum" do
      assert_equal [@jazeveda, @jblake], Officer.officer_role.to_a.sort_by{|o| o.last_name}
      assert_equal [@msawyer], Officer.chief_role.to_a
      assert_equal [@jgordon, @gloeb], Officer.commish_role.to_a.sort_by{|o| o.last_name}
    end


  end
end
