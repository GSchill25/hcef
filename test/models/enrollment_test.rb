require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   should belong_to(:child)
   should belong_to(:program)

   should validate_presence_of(:child_id)
   should validate_presence_of(:program_id)
   should validate_numericality_of(:child_id)
   should validate_numericality_of(:program_id)

   should allow_value(5).for(:child_id)
   should_not allow_value(0).for(:child_id)
   should_not allow_value(-5).for(:child_id)

   should allow_value(5).for(:program_id)
   should_not allow_value(0).for(:program_id)
   should_not allow_value(-5).for(:program_id)
end
