require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should belong_to(:instructor)
  should have_secure_password

  # test validations
  should validate_presence_of(:username)

  should allow_value("admin").for(:role)
  should allow_value("instructor").for(:role)
  should allow_value("guardian").for(:role)
  should_not allow_value(nil).for(:role)
  should_not allow_value("children").for(:role)
  should_not allow_value("29394").for(:role)

  context "Within context" do
    setup do
      create_instructors
      create_guardians
      create_users
    end

    teardown do
      delete_instructors
      delete_guardians
      delete_users
    end

    should "require users to have unique, case-insensitive usernames" do
      assert_equal "admin", @user1.username
      # try to switch to Alex's username 'tank'
      @user1.username = "instrUctor1"
      deny @user1.valid?, "#{@user1.username}"
    end

    should "allow user to authenticate with password" do
      assert @user2.authenticate("instructor1")
      deny @user2.authenticate("wrongpassword")
    end

    should "require a password for new users" do
      bad_user = FactoryGirl.build(:user, username: "bad_user1", instructor: @instructor1, role: "admin", password: nil)
      deny bad_user.valid?
    end
    
    should "require passwords to be confirmed and matching" do
      bad_user_1 = FactoryGirl.build(:user, username: "bad_user1", instructor: @instructor1, role: "admin", password: "asdf", password_confirmation: nil)
      deny bad_user_1.valid?
      bad_user_2 = FactoryGirl.build(:user, username: "bad_user2", instructor: @instructor2, role: "admin", password: "asdf", password_confirmation: "fdsa")
      deny bad_user_2.valid?
    end
    
    should "require passwords to be at least four characters" do
      bad_user = FactoryGirl.build(:user, username: "tank", instructor: @alex, password: "no")
      deny bad_user.valid?
    end

    should "have a role? method to use in authorization" do
      assert @user1.role?(:admin)
      deny @user1.role?(:instructor)
    end

    should "show authenticate method works properly" do
      assert User.authenticate(@user1.username, @user1.password)
      deny User.authenticate(@user1.username, "wrong")
    end
    
  end
  
end
