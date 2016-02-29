require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # test relationships
  should have_many(:assignments)
  should have_many(:locations).through(:assignments)
  should have_one(:user)
  should accept_nested_attributes_for(:user)

  # test validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  context "Within context" do
    setup do 
      create_users
      create_instructors
    end
    
    teardown do
      delete_users
      delete_instructors
    end

    should "show that name works with alphabetical" do
      assert_equal ["Do, Alex", "Doe, Mark", "Lee, Phil", "McDonald, John"], Instructor.alphabetical.all.map(&:name)
    end

    should "show that proper name works" do
      assert_equal "Mark Doe", @instructor1.proper_name
      assert_equal "Alex Do", @instructor3.proper_name
    end

    should "show that active works" do
      assert_equal true, @instructor2.is_active
      assert_equal false, @instructor4.is_active
    end

  end

end
