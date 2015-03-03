require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  should belong_to(:instructor)
  should belong_to(:program)

  should allow_value("1").for(:instructor_id)
  should_not allow_value(nil).for(:instructor_id)
  should_not allow_value("one").for(:instructor_id)
  should_not allow_value("0").for(:instructor_id)

  should allow_value("1").for(:program_id)
  should_not allow_value(nil).for(:program_id)
  should_not allow_value("one").for(:program_id)
  should_not allow_value("0").for(:program_id)
end
