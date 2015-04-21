require 'test_helper'

class SubLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should belong_to(:location)
end
