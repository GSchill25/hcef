module Contexts
  module InstructorContexts
    def create_programs
      # assumes create_curriculums prior
      @instructor1 = FactoryGirl.create(:instructor, first_name: "Mark", last_name: "Doe")
      @instructor2 = FactoryGirl.create(:instructor, first_name: "John", last_name: "McDonald")
      @instructor3 = FactoryGirl.create(:instructor, first_name: "Alex", last_name: "Kim")
    end

    def delete_programs
      @instructor1.delete
      @instructor2.delete
      @instructor3.delete
      #delete_curriculums
    end
  end
end