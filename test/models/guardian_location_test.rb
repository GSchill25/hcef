require 'test_helper'

class GuardianLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:location)
  should belong_to(:guardian)
end
