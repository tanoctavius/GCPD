require 'test_helper'

class ChiefAbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "verify the abilities of chief users in GCPD" do
      create_chief_abilities
      # no global privileges
      deny @msawyer_ability.can? :manage, :all
      # testing particular abilities
      assert @msawyer_ability.can? :read, :all
      assert @msawyer_ability.can? :manage, Investigation
      assert @msawyer_ability.can? :manage, InvestigationNote
      assert @msawyer_ability.can? :manage, CrimeInvestigation
      assert @msawyer_ability.can? :manage, Assignment
      assert @msawyer_ability.can? :read, Unit
      assert @msawyer_ability.can? :create, Officer
      assert @msawyer_ability.can? :update, @major_crimes
      deny @msawyer_ability.can? :update, @homicide
      assert @msawyer_ability.can? :manage, @jblake
      deny @msawyer_ability.can? :manage, @jgordon
    end
  end
end