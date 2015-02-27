require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_many(:children)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:phone)
end
