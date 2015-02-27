class School < ActiveRecord::Base
	#relationships
	has_many :children

	#validations
	validates_presence_of :name
end
