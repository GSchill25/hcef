require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:children)

  should validate_presence_of(:name)
end
