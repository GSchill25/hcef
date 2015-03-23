require 'test_helper'

class GuardianTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should have_many(:children)

  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:phone)
  should validate_presence_of(:email)

  should allow_value("hcef@hcef.com").for(:email)
  should allow_value("hcef@andrew.cmu.edu").for(:email)
  should allow_value("hcef@hcef.org").for(:email)
  should allow_value("hcef1212@hcef.gov").for(:email)
  should allow_value("my.hcef@hcef.net").for(:email)
  
  should_not allow_value("hcef").for(:email)
  should_not allow_value("hcef@org,com").for(:email)
  should_not allow_value("hcef@org.uk").for(:email)
  should_not allow_value("my hcef@org.com").for(:email)
  should_not allow_value("hcef@org.con").for(:email)
  
  should allow_value("4122683259").for(:phone)
  should allow_value("412-268-3259").for(:phone)
  should allow_value("412.268.3259").for(:phone)
  should allow_value("(412) 268-3259").for(:phone)
  
  should_not allow_value("219329").for(:phone)
  should_not allow_value("7249483259x224").for(:phone)
  should_not allow_value("800-OUR-HCEF").for(:phone)
  should_not allow_value("724/568/1539").for(:phone)
  should_not allow_value("724-9863-124").for(:phone)

  should allow_value(1.day.ago.to_date).for(:date_of_birth)
  should_not allow_value(1.day.from_now.to_date).for(:date_of_birth)
  should_not allow_value(Date.today).for(:date_of_birth)
  should_not allow_value("bad").for(:date_of_birth)
  should_not allow_value(2).for(:date_of_birth)
end
