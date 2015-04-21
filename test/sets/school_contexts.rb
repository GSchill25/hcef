module Contexts
  module SchoolContexts
  	def create_schools
  		@school1 = FactoryGirl.create(:school, name: "School1", address_line_one: "1000 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125550001")
  		@school2 = FactoryGirl.create(:school, name: "School2", address_line_one: "2000 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125550002")
  		@school3 = FactoryGirl.create(:school, name: "School3", address_line_one: "3000 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125550003")
  	end

  	def delete_schools
		@school1.delete
		@school2.delete
		@school3.delete
	end
  end
end