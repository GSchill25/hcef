require 'test_helper'

class SchoolDistrictTest < ActiveSupport::TestCase
  should have_many(:schools)

  should validate_presence_of(:name)
end
