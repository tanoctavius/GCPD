require 'test_helper'

class OfficerAbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "verify the abilities of officer users in GCPD" do
      create_officer_abilities
      # no global privileges
      deny @jblake_ability.can? :manage, :all
      # testing particular abilities
      assert @jblake_ability.can? :read, Investigation
      assert @jblake_ability.can? :new, Investigation
      assert @jblake_ability.can? :create, Investigation
      assert @jblake_ability.can? :update, @lacey
      deny @jblake_ability.can? :update, @pussyfoot
      assert @jblake_ability.can? :manage, InvestigationNote
      assert @jblake_ability.can? :read, Assignment
      assert @jblake_ability.can? :read, Crime
      assert @jblake_ability.can? :manage, CrimeInvestigation
      assert @jblake_ability.can? :read, @jblake
      deny @jblake_ability.can? :read, @msawyer
      assert @jblake_ability.can? :update, @jblake
      deny @jblake_ability.can? :update, @msawyer
      assert @jblake_ability.can? :index, Unit
      assert @jblake_ability.can? :show, @major_crimes
      deny @jblake_ability.can? :show, @homicide
    end
  end
end