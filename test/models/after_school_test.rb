require 'test_helper'

class AfterSchoolTest < ActiveSupport::TestCase
  should belong_to(:program)
  should belong_to(:child)

  should validate_presence_of(:date)
  should validate_presence_of(:time_in)
  should validate_presence_of(:time_out)
  should validate_numericality_of(:total_hours)

  should_not allow_value(nil).for(:date)
  
  context "Within context" do
    setup do 
      create_locations
      create_programs
      create_guardians
      create_guardian_locations
      create_schools
      create_children
      create_enrollments
      create_child_locations
      create_after_schools
    end
    
    teardown do
      delete_locations
      delete_programs
      delete_guardians
      delete_guardian_locations
      delete_schools
      delete_children
      delete_child_locations
      delete_enrollments
      delete_after_schools
    end
    #ascending
    #descending
    #for_program
    #for_date
    #total_time

    should "show that total_time works" do
      assert_equal 30, @as1.total_time
      assert_equal 0, @as3.total_time
    end

  end
end