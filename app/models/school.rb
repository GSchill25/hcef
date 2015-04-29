class School < ActiveRecord::Base
	#relationships
	has_many :children
	belongs_to :school_district

	#validations
	validates_presence_of :name


	def name
		return self.name
	end
end
