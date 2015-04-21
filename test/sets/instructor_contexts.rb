module Contexts
  module InstructorContexts
    def create_instructors
      @instructor1 = FactoryGirl.create(:instructor, first_name: "Mark", last_name: "Doe", user: @user1)
      @instructor2 = FactoryGirl.create(:instructor, first_name: "John", last_name: "McDonald", user: @user2)
      @instructor3 = FactoryGirl.create(:instructor, first_name: "Alex", last_name: "Do", user: @user3)
      @instructor4 = FactoryGirl.create(:instructor, first_name: "Phil", last_name: "Lee", user: @user5)
    end

    def delete_instructors
      @instructor1.delete
      @instructor2.delete
      @instructor3.delete
      @instructor4.delete
    end
  end
end