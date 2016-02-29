require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_many(:children)
  should have_many(:guardian_locations)
  should have_many(:locations).through(:guardian_locations)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  should allow_value(2.days.ago.to_date).for(:date_of_birth_two)
  should_not allow_value(1.day.from_now.to_date).for(:date_of_birth_two)
  should_not allow_value(Date.today).for(:date_of_birth_two)
  should_not allow_value("bad").for(:date_of_birth_two)
  should_not allow_value(2).for(:date_of_birth_two)

  context "Within context" do
    setup do 
      create_guardians
    end
    
    teardown do
      delete_guardians
    end

    should "show that name works with alphabetical" do
      assert_equal ["Aaron Cho", "Kevin Kim", "Michael Lee", "Steve Park"], Guardian.alphabetical.all.map(&:name)
    end
    
  end
end
