module Contexts
  module GuardianContexts
  	def create_guardians
  		@Kim = FactoryGirl.create(:guardian, first_name: "Kevin", last_name: "Kim", phone: "4125551122", email: "kevinkim@example.com", date_of_birth: Date.new(1980,1,1))
  		@Lee = FactoryGirl.create(:guardian, first_name: "Michael", last_name: "Lee", phone: "4125551122", email: "kevinkim@example.com", date_of_birth: Date.new(1980,2,1))
  		@Park = FactoryGirl.create(:guardian, first_name: "Steve", last_name: "Park", phone: "4125551122", email: "kevinkim@example.com", date_of_birth: Date.new(1980,3,1))
  		@Cho = FactoryGirl.create(:guardian, first_name: "Aaron", last_name: "Cho", phone: "4125551122", email: "kevinkim@example.com", date_of_birth: Date.new(1980,4,1))
  	end

  	def delete_guardians
  		@Kim.delete
  		@Lee.delete
  		@Park.delete
  		@Cho.delete
  	end

  end
end