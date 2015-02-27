require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_many(:after_schools)
  should have_one(:enrichment)
  should have_one(:field_trip)

  should validate_presence_of(:name)
  should validate_presence_of(:type)
  #inclusion in [enrichment, after_school, field_trip]
  #should validate_date(:start_date)
  #should validate_date(:end_date)
  #on/after start_date
end
