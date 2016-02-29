module Contexts
  module ChildContexts
  	def create_children
  		@child1 = FactoryGirl.create(:child, first_name: "Alex", last_name: "Kim", date_of_birth: Date.new(2003,4,1), grade: 5, active: true, school: @school1, guardian: @Kim)
  		@child2 = FactoryGirl.create(:child, first_name: "Jason", last_name: "Lee", date_of_birth: Date.new(2002,4,1), grade: 6, active: true, school: @school2, guardian: @Lee)
  		@child3 = FactoryGirl.create(:child, first_name: "Paul", last_name: "Park", date_of_birth: Date.new(2001,4,1), grade: 7, active: true, school: @school3, guardian: @Park)
  	  @inactive_child = FactoryGirl.create(:child, first_name: "Richard", last_name: "Cho", date_of_birth: Date.new(2006,4,3), grade: 2, active: false, school: @school1, guardian: @Cho)
    end

  	def delete_children
  		@child1.delete
  		@child2.delete
  		@child3.delete
      @inactive_child.delete
  	end
  end
end