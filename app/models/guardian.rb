class Guardian < ActiveRecord::Base
	#add date of birth to uniquely identify

	#relationships
	has_many :children
	has_many :guardian_locations
	has_many :locations, through: :guardian_locations

	#validations
	validates_presence_of :first_name, :last_name
	validates_date :date_of_birth_two, :before => lambda { Date.today }, on: :create

	#scopes
	scope :alphabetical, -> { order('last_name', 'first_name')}

	#methods
	def name
		"#{first_name} #{last_name}"
	end

end
