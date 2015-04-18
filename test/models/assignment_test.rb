require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  should belong_to(:instructor)
  should belong_to(:location)

  should allow_value("1").for(:instructor_id)
  should_not allow_value(nil).for(:instructor_id)
  should_not allow_value("one").for(:instructor_id)
  should_not allow_value("0").for(:instructor_id)

  should allow_value("1").for(:location_id)
  should_not allow_value(nil).for(:location_id)
  should_not allow_value("one").for(:location_id)
  should_not allow_value("0").for(:location_id)
end
