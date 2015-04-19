module Contexts
  module ChildContexts
  	def create_children
  		@child1 = FactoryGirl.create(:child, first_name: "Alex", last_name: "Kim", date_of_birth:Date.new(2005,4,1), grade: 5, active: true, school: @school1, guardian: @Kim)
  		@child2 = FactoryGirl.create(:child, first_name: "Jason", last_name: "Lee", date_of_birth:Date.new(2005,4,1), grade: 6, active: true, school: @school2, guardian: @Lee)
  		@child3 = FactoryGirl.create(:child, first_name: "Paul", last_name: "Park", date_of_birth:Date.new(2005,4,1), grade: 7, active: true, school: @school3, guardian: @Park)
  	end

  	def delete_children
  		@child1.delete
  		@child2.delete
  		@child3.delete
  	end
  end
end