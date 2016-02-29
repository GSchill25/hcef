require 'test_helper'

class SubLocationTest < ActiveSupport::TestCase

  should belong_to(:location)

  should validate_presence_of(:name)

  context "Within context" do
    setup do
      create_locations
      create_sub_locations
    end

    teardown do
      delete_locations
      delete_sub_locations
    end

    should "show that alphabetical works" do
      assert_equal ["Asiana", "Bigelow", "Craig", "Fifth", "Forbes", "Resnik", "Schatz", "Skibo"], SubLocation.all.alphabetical.map(&:name)
    end
  end
end
