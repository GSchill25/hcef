module Contexts
  module FieldTripDayContexts
  	def create_field_trip_days
  		@fieldtripday1 = FactoryGirl.create(:field_trip_day, fieldtrip: @fieldtrip1, child: @child3)
  	end

  	def delete_field_trip_days
  		@fieldtripday1.delete
  	end
  end
end