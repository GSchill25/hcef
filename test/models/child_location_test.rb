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

   #def child_is_not_already_assigned_to_location
   #   return true if self.location.nil? || self.child.nil?
   #   unless ChildLocation.where(child_id: self.child_id, location_id: self.location_id).to_a.empty?
   #     errors.add(:base, "Child already belongs to this location")
   #   end
   #end  
end
