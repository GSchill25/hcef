require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:assignments)
  should have_many(:locations).through(:assignments)
  should have_one(:user)
  should accept_nested_attributes_for(:user)

  # test validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

end
