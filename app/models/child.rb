class Child < ActiveRecord::Base
	#relationships
	belongs_to :school
	belongs_to :guardian
	has_many :enrollments
	has_many :programs, through: :enrollments

	#validations
	validates_presence_of :first_name, :last_name#, :date_of_birth
	#validates_date



	#methods
	def name
		"#{first_name} #{last_name}"
	end

	
end
