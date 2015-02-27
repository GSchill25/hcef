require 'test_helper'

class AfterSchoolTest < ActiveSupport::TestCase
  should belong_to(:program)

  should validate_presence_of(:date)
  should validate_date(:date)
  should validate_timestamp(:time_in)
  should validate_timestamp(:time_out)
  should validate_numericality_of(:total_hours)
  # Test for >= 0
end
