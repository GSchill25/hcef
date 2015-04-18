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
  should validate_presence_of(:address_line_one)
  should validate_presence_of(:city)
  should validate_presence_of(:state)
  should validate_presence_of(:zip)
  should validate_presence_of(:phone)
  #Zip
  #Phone
end
