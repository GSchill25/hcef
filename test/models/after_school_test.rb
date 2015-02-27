require 'test_helper'

class AfterSchoolTest < ActiveSupport::TestCase
  should belong_to(:program)

  should validate_presence_of(:date)
  should validate_date(:date)
  should validate_presence_of(:time_in)
  should validate_presence_of(:time_out)
  #should validate_format_of times
  #should validate timeout is after timein
  should validate_numericality_of(:total_hours)
  # Test for >= 0
end
