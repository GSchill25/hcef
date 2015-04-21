require 'test_helper'

class AfterSchoolTest < ActiveSupport::TestCase
  should belong_to(:program)
  should belong_to(:child)

  should validate_presence_of(:date)
  should validate_presence_of(:time_in)
  should validate_presence_of(:time_out)
  should validate_numericality_of(:total_hours)

  should_not allow_value(nil).for(:date)
  
  
end