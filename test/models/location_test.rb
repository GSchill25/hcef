require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  should have_many(:programs)

  should validate_presence_of(:name)
  should validate_presence_of(:address_line_one)
  should validate_presence_of(:city)
  should validate_presence_of(:state)
  should validate_presence_of(:zip)
  should validate_presence_of(:phone)
  #Zip
  #Phone
end
