require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should have_many(:programs)
  should have_many(:guardian_locations)
  should have_many(:child_locations)
  should have_many(:assignments)
  should have_many(:children).through(:child_locations)
  should have_many(:guardians).through(:guardian_locations)
  should have_many(:instructors).through(:assignments)


  should validate_presence_of(:name)
  #alphabetical
  context "Within context" do
    setup do 
      create_locations
    end
    
    teardown do
      delete_locations
    end

    should "show that alphabetical works" do
      assert_equal ["CMU", "UPitt"], Location.all.alphabetical.map(&:name)
    end
  end
end
