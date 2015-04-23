require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  should have_many(:children)
  should validate_presence_of(:name)
  
end
