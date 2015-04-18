require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_many(:after_schools)
  should have_one(:enrichment)
  should have_one(:field_trip)
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
      create_field_trips
      create_enrichments
      create_after_schools
      create_locations
      create_programs
    end
    
    teardown do
      delete_programs
      delete_locations
      delete_after_schools
      delete_enrichments
      delete_field_trips
    end

    should "show that there are four programs" do
      assert_equal ["AfterSchool", "Enrichment", "FieldTrip", "Inactive", "Upcoming"], Program.alphabetical.all.map(&:name)
    end

    should "show that there are three active programs" do
      assert_equal 3, Program.active.size
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
      assert_equal ["Inactive", "FieldTrip", "Enrichment", "AfterSchool", "Upcoming"], Program.ascending.all.map(&:name)
    end

    should "show that descending works" do
      assert_equal ["Upcoming", "AfterSchool", "Enrichment", "FieldTrip", "Inactive"], Program.descending.all.map(&:name)
    end
  end

    #by_location
end
