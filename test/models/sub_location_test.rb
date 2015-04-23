require 'test_helper'

class SubLocationTest < ActiveSupport::TestCase

  should belong_to(:location)

  should validate_presence_of(:name)
  should validate_presence_of(:address_line_one)
  should validate_presence_of(:city)
  should validate_presence_of(:state)
  should validate_presence_of(:zip)
  should validate_presence_of(:phone)
  #Zip
  should allow_value("12345").for(:zip)
  should allow_value("18298-4834").for(:zip)

  should_not allow_value("4028389").for(:zip)
  should_not allow_value("3837-49832758").for(:zip)
  #Phone
  should allow_value("0000000000").for(:phone)
  should allow_value("(412)-555-5555").for(:phone)
  should allow_value("412.555.5555").for(:phone)
  should allow_value("849-939-3938").for(:phone)

  should_not allow_value("8230942730235").for(:phone)
  should_not allow_value(")412)-84-93848").for(:phone)

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
