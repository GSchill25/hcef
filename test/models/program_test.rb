require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_many(:after_schools)
  should have_many(:enrichments)
  should have_many(:field_trips)
  should have_many(:enrollments)
  should have_many(:children).through(:enrollments)

  should validate_presence_of(:name)
  should validate_presence_of(:program_type)

  should allow_value("after_school").for(:program_type)
  should allow_value("enrichment").for(:program_type)
  should allow_value("field_trip").for(:program_type)

  should_not allow_value(12345).for(:program_type)
  should_not allow_value(nil).for(:program_type)
  should_not allow_value("AFTERSCHOOL").for(:program_type)

  should allow_value(Date.today).for(:start_date)
  should allow_value(10.days.from_now).for(:start_date)

  should_not allow_value(12345).for(:start_date)
  should_not allow_value(nil).for(:start_date)

  should allow_value(Date.today).for(:end_date)
  should allow_value(10.days.from_now).for(:end_date)

  should_not allow_value(12345).for(:end_date)
  should_not allow_value(nil).for(:end_date)

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

    should "show that there are four programs" do
      assert_equal ["AfterSchool", "Enrichment", "FieldTrip", "Inactive", "Upcoming"], Program.alphabetical.all.map(&:name)
    end

    should "show that there are three active programs" do
      assert_equal 4, Program.active.size
      assert_equal ["AfterSchool", "Enrichment", "FieldTrip", "Upcoming"], Program.active.alphabetical.all.map(&:name)
    end
    
    should "show that there is one inactive program" do
      assert_equal 1, Program.inactive.size
      assert_equal ["Inactive"], Program.inactive.all.map(&:name)
    end

    should "show that there is one upcoming program" do
      assert_equal 1, Program.upcoming.size
      assert_equal ["Upcoming"], Program.upcoming.all.map(&:name)
    end

    should "show that ascending works" do
      assert_equal ["Inactive", "FieldTrip", "AfterSchool", "Enrichment", "Upcoming"], Program.ascending.all.map(&:name)
    end

    should "show that descending works" do
      assert_equal ["Upcoming", "Enrichment", "AfterSchool", "FieldTrip", "Inactive"], Program.descending.all.map(&:name)
    end

    should "show that average time works" do
      assert_equal [["Homework", 6],["Literacy", 6],["Technology", 3],["Reading Specialist", 3]], @program1.average_time
      assert_equal [["Homework", 0],["Literacy", 0],["Technology", 0],["Reading Specialist", 0]], @program4.average_time
    end

    should "show program_days works" do
      assert_equal [[1.day.ago.to_date, 1], [Date.today, 1]], @program1.program_days
    end

    should "show by_location works" do
      assert_equal [@child1, @child2], @program1.by_location(1)
    end
  end
end
