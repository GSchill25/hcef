require 'test_helper'

class ProviderTest < ActiveSupport::TestCase
  should have_many(:enrichments)
  should have_many(:field_trips)

  should validate_presence_of(:name)

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
      create_providers
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
      delete_providers
    end

    should "show that there are four providers, listed alphabetically" do
      assert_equal ["Provider1", "Provider2", "Provider3", "Provider4"], Provider.alphabetical.all.map(&:name)
    end

    should "require provider to have unique, case-insensitive names" do
      assert_equal "Provider1", @provider1.name
      # try to switch to Alex's username 'tank'
      @provider1.name = "prOVidEr3"
      deny @provider1.valid?, "#{@provider1.name}"
    end

  end

end
