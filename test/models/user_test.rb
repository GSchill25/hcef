require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should belong_to(:instructor)
  #should belong_to(:guardian)
  should have_secure_password

  # test validations
  should validate_presence_of(:username)

  should allow_value("admin").for(:role)
  should allow_value("instructor").for(:role)
  should allow_value("children").for(:role)
  should_not allow_value(nil).for(:role)
  should_not allow_value("guardian").for(:role)
  should_not allow_value("29394").for(:role)
  
end
