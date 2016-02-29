class Enrollment < ActiveRecord::Base
	#relationships
	belongs_to :child
	belongs_to :program

	#validations
	validates :child_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  	validates :program_id, presence: true, numericality: { greater_than: 0, only_integer: true }
end
