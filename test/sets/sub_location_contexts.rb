module Contexts
  module SubLocationContexts
  	def create_sub_locations
  		@sub1 = FactoryGirl.create(:sub_location, name: "Skibo", address_line_one: "5001 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557771", location: @CMU)
  		@sub2 = FactoryGirl.create(:sub_location, name: "Asiana", address_line_one: "5002 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557772", location: @CMU)
  		@sub3 = FactoryGirl.create(:sub_location, name: "Schatz", address_line_one: "5003 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557773", location: @CMU)
  		@sub4 = FactoryGirl.create(:sub_location, name: "Resnik", address_line_one: "5004 Forbes Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557774", location: @CMU)
  		@sub5 = FactoryGirl.create(:sub_location, name: "Craig", address_line_one: "4201 Fifth Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557717", location: @UPitt)
  		@sub6 = FactoryGirl.create(:sub_location, name: "Fifth", address_line_one: "4202 Fifth Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557727", location: @UPitt)
  		@sub7 = FactoryGirl.create(:sub_location, name: "Forbes", address_line_one: "4203 Fifth Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557737", location: @UPitt)
  		@sub8 = FactoryGirl.create(:sub_location, name: "Bigelow", address_line_one: "4204 Fifth Ave", address_line_two: "", city: "Pittsburgh", state: "PA", zip: 15213, phone: "4125557747", location: @UPitt)

    end

  	def delete_sub_locations
  		@sub1.delete
  		@sub2.delete
  		@sub3.delete
  		@sub4.delete
  		@sub5.delete
  		@sub6.delete
  		@sub7.delete
  		@sub8.delete
  	end
  end
end