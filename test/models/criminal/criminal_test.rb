require 'test_helper'

class CriminalTest < ActiveSupport::TestCase
  # Relationship matchers
  should have_many(:suspects)
  should have_many(:investigations).through(:suspects)

  # Validation matchers
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  # Context
  context "Within context" do
    setup do
      create_criminals
    end

    should "shows name as last, first name" do
      assert_equal "Kyle, Selina", @catwoman.name
    end   
    
    should "shows proper name as first and last name" do
      assert_equal "Selina Kyle", @catwoman.proper_name
    end

  end
end
