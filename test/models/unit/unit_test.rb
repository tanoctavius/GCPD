require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  # Relationship matchers
  should have_many(:officers)
  should have_many(:assignments).through(:officers)

  # Validation matchers
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).case_insensitive

end
