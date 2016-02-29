require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  should have_many(:children)
  should belong_to(:school_district)

  should validate_presence_of(:name)
  
end
