require 'test_helper'

class ChildLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   should belong_to(:child)
   should belong_to(:location)

   should validate_presence_of(:child_id)
   should validate_presence_of(:location_id)
   should validate_numericality_of(:child_id)
   should validate_numericality_of(:location_id)

   should allow_value(5).for(:child_id)
   should_not allow_value(0).for(:child_id)
   should_not allow_value(-5).for(:child_id)

   should allow_value(5).for(:location_id)
   should_not allow_value(0).for(:location_id)
   should_not allow_value(-5).for(:location_id)
end
