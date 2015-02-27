require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test relationships
  #should have_many(:assignments)
  #should have_many(:programs).through(:assignments)
  should belong_to(:user)

  # test validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

end
