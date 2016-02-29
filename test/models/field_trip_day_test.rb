require 'test_helper'

class FieldTripDayTest < ActiveSupport::TestCase
  should belong_to(:child)
  should belong_to(:field_trip)
end
