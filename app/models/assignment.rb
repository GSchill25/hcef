class Assignment < ActiveRecord::Base
	belongs_to :instructor
	belongs_to :location

  	validates :location_id, presence: true, numericality: { greater_than: 0, only_integer: true }

  	#think about some methods that will be useful
end
