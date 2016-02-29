require 'test_helper'

class ChildLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

   should belong_to(:child)
   should belong_to(:location)

   #def child_is_not_already_assigned_to_location
   #   return true if self.location.nil? || self.child.nil?
   #   unless ChildLocation.where(child_id: self.child_id, location_id: self.location_id).to_a.empty?
   #     errors.add(:base, "Child already belongs to this location")
   #   end
   #end 

   context "Within context" do
    setup do
      create_guardians
      create_schools
      create_children
      create_locations
      create_child_locations
    end

    teardown do
      delete_guardians
      delete_schools
      delete_children
      delete_locations
      delete_child_locations
    end

    should "not assign child to same location when they are already assigned" do
      bad_cl = FactoryGirl.build(:child_location, start_date: Date.new(2014,7,1), child: @child2, location: @CMU)
      deny bad_cl.valid?
    end
  end

end
