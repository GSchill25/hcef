class Assignment < ActiveRecord::Base
	belongs_to :instructor
	belongs_to :location

	validates :instructor_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  	validates :program_id, presence: true, numericality: { greater_than: 0, only_integer: true }

  	#think about some methods that will be useful
end
