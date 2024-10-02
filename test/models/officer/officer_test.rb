require 'test_helper'

class OfficerTest < ActiveSupport::TestCase
  # Relationship matchers
  should belong_to(:unit)
  should have_many(:assignments)
  should have_many(:investigations).through(:assignments)

  # Validation matchers
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:unit_id)
  should validate_uniqueness_of(:ssn)

  should allow_value("123456789").for(:ssn)
  should allow_value("123-45-6789").for(:ssn)
  should allow_value("123 45 6789").for(:ssn)
  should_not allow_value("12345678").for(:ssn)
  should_not allow_value("1234567890").for(:ssn)
  should_not allow_value("bad").for(:ssn)
  should_not allow_value(nil).for(:ssn)

  # short way...
  # should validate_inclusion_of(:rank).in_array(%w[Officer Sergeant Detective Detective\ Sergeant Lieutenant Captain Commissioner])
  # long way (and better because it does not assume method format)...
  should allow_value("Officer").for(:rank)
  should allow_value("Sergeant").for(:rank)
  should allow_value("Detective").for(:rank)
  should allow_value("Detective Sergeant").for(:rank)
  should allow_value("Lieutenant").for(:rank)
  should allow_value("Captain").for(:rank)
  should allow_value("Commissioner").for(:rank)
  should allow_value(nil).for(:rank)
  should_not allow_value("bad").for(:rank)
  should_not allow_value("officer").for(:rank)
  should_not allow_value("Major").for(:rank)
  should_not allow_value("1").for(:rank)

  # Validating role
  should allow_value(1).for(:role)
  should allow_value(2).for(:role)
  should allow_value(3).for(:role)
  should allow_value("officer").for(:role)
  should allow_value("chief").for(:role)
  should allow_value("commish").for(:role)
  should_not allow_value(nil).for(:role)

  # Context
  context "Within context" do
    setup do
      create_units
      create_officers
    end

    should "identify placing officer in a non-active unit is invalid" do
      bad_officer_unit = FactoryBot.build(:officer, first_name: "Gil", last_name: "Loeb", rank: "Captain", unit: @section_31)
      deny bad_officer_unit.valid?
      ghost_officer_unit = FactoryBot.build(:officer, first_name: "Gil", last_name: "Loeb", rank: "Captain", unit: nil)
      deny ghost_officer_unit.valid?
    end


  end
end
