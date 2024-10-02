require 'test_helper'

class CommishAbilityTest < ActiveSupport::TestCase
  context "Within context" do
    should "verify the abilities of commish users to do everything" do
      create_commish_abilities
      assert @jgordon_ability.can? :manage, :all
    end
  end
end