module Contexts
  module FieldTripContexts
  	def create_field_trips
  		@fieldtrip1 = FactoryGirl.create(:field_trip, length: 5, notes: "field trip program", program: @program3)
  	end

  	def delete_field_trips
  		@fieldtrip1.delete
  	end
  end
end