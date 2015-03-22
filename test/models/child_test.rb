require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:school)
  should belong_to(:guardian)
  should have_many(:enrollments)
  should have_many(:child_locations)
  should have_many(:programs).through(:enrollments)
  should have_many(:locations).through(:child_locations)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:date_of_birth)

  should allow_value(1.day.ago.to_date).for(:date_of_birth)
  should_not allow_value(1.day.from_now.to_date).for(:date_of_birth)
  should_not allow_value(Date.today).for(:date_of_birth)
  should_not allow_value("bad").for(:date_of_birth)
  should_not allow_value(2).for(:date_of_birth)
end
