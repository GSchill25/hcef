class Child < ActiveRecord::Base
	#relationships
	belongs_to :school
	belongs_to :guardian
	has_many :enrollments
	has_many :programs, through: :enrollments
	has_many :child_locations
	has_many :locations, through: :child_locations
	has_many :field_trip_days
	has_many :field_trips, through: :field_trip_days
	has_many :enrichment_days
	has_many :enrichments, through: :enrichment_days

	#validations
	validates_presence_of :first_name, :last_name, :date_of_birth, :location_id
	validates_date :date_of_birth, :before => lambda { Date.today }, on: :create


	#scopes
	scope :alphabetical, -> { order('last_name', 'first_name')}



	#methods
	def name
		"#{first_name} #{last_name}"
	end

	
end
