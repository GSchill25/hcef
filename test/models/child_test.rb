require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:school)
  should belong_to(:guardian)
  should have_many(:enrollments)
  should have_many(:child_locations)
  should have_many(:programs).through(:enrollments)
  should have_many(:locations).through(:child_locations)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:date_of_birth)

  should allow_value(2.days.ago.to_date).for(:date_of_birth)
  should_not allow_value(1.day.from_now.to_date).for(:date_of_birth)
  should_not allow_value(Date.today).for(:date_of_birth)
  should_not allow_value("bad").for(:date_of_birth)
  should_not allow_value(2).for(:date_of_birth)

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
      create_enrichments
      create_field_trips
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
      delete_enrichments
      delete_field_trips
    end

    should "show that name works, with alphabetical" do
      assert_equal ["Richard Cho", "Alex Kim", "Jason Lee", "Paul Park"], Child.alphabetical.all.map(&:name)
    end

    should "show total time works" do
      assert_equal 30, @child1.total_time
      assert_equal nil, @inactive_child.total_time
    end

    should "show average time works" do
      assert_equal [["Homework", 10], ["Literacy", 10], ["Technology", 5], ["Reading Specialist", 5], ["Physical Activity", 0], ["Hands On Time", 0]], @child1.average_activity_time
      assert_equal nil, @inactive_child.average_activity_time
    end

  end
end
