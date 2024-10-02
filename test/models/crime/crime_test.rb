require 'test_helper'

class CrimeTest < ActiveSupport::TestCase
  # Relationship matchers
  should have_many(:crime_investigations)
  should have_many(:investigations).through(:crime_investigations)
  
  # Validation matchers
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

  # Context
  context "Within context" do
    setup do
      create_crimes
    end

    should "have make_active and make_inactive methods" do
      assert @arson.active
      @arson.make_inactive
      @arson.reload
      deny @arson.active
      @arson.make_active
      @arson.reload
      assert @arson.active
    end

    should "never be destroyed" do
      deny @arson.destroy
    end
  end
end
