require 'test_helper'

class OfficerAuthenticationTest < ActiveSupport::TestCase
# Context
  context "Within context" do
    setup do
      create_units
      create_officers
    end

    should "require users to have unique, case-insensitive usernames" do
      assert_equal "jblake", @jblake.username
      @jblake.username = "JGordon"
      deny @jblake.valid?, "UN: #{@jblake.username}"
    end

    should "require a password for new users" do
      bad_user = FactoryBot.build(:officer, first_name: "Mark", username: "mark", last_name: "Heimann", role: "officer", password: nil)
      deny bad_user.valid?
    end

    should "require passwords to be confirmed and matching" do
      bad_user_1 = FactoryBot.build(:officer, first_name: "Mark", username: "mark", last_name: "Heimann", role: "officer", password: "secret", password_confirmation: nil)
      deny bad_user_1.valid?
      bad_user_2 = FactoryBot.build(:officer, first_name: "Mark", username: "mark", last_name: "Heimann", role: "officer", password: "secret", password_confirmation: "sauce")
      deny bad_user_2.valid?
    end

    should "require passwords to be at least four characters" do
      bad_user = FactoryBot.build(:officer, first_name: "Mark", username: "mark", last_name: "Heimann", role: "officer", password: "non", password_confirmation: "non")
      deny bad_user.valid?
    end

    should "have class method to handle authentication services" do
      assert Officer.authenticate('jblake', 'secret')
      deny Officer.authenticate('jblake', 'notsecret')
    end

    should "have instance method to handle authentication services" do
      assert_equal @jblake, @jblake.authenticate('secret')
      deny @jblake.authenticate('notsecret')
    end

    should "have role methods and recognize all three roles" do
      assert @jblake.officer_role? # should be an officer
      deny @jblake.chief_role?
      deny @jblake.commish_role?
      deny @msawyer.officer_role?
      assert @msawyer.chief_role? # should be a chief
      deny @msawyer.commish_role?
      deny @jgordon.officer_role?
      deny @jgordon.chief_role?
      assert @jgordon.commish_role? # should be a commish
    end

  end
end
