class Assignment < ActiveRecord::Base
	belongs_to :instructor
	belongs_to :location

	#validation for instructor_id has been left out on purpose
	#since assignment was being created before instructor, any validation on instructor would fail
	#because assignment would attempt to connect locaiton to empty class
  	validates :location_id, presence: true, numericality: { greater_than: 0, only_integer: true }



end
