class FieldTripDay < ActiveRecord::Base
	belongs_to :child
	belongs_to :field_trip
	
end
