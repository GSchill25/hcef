class Instructor < ActiveRecord::Base

	has_one :user
	has_many :assignments
	has_many :locations, through: :assignments
	
	accepts_nested_attributes_for :user, reject_if: lambda { |user| user[:username].blank? or user[:password].blank? }

	validates :first_name, presence: true
	validates :last_name, presence: true
	validate :has_location, on: :create

	scope :alphabetical, -> { order('last_name', 'first_name')}


	def name
		"#{self.last_name}, #{self.first_name}"
	end

	def proper_name
		"#{self.first_name} #{self.last_name}"
	end

	def is_active
		return true if self.user.active
		return false
	end

	#checks to see if the instructor is assigned to location before creation
	#ignores this check if the user is admin
	def has_location
		return true if self.user.role == 'admin'
		unless self.locations.size > 0
			errors.add(:base, "Instructor must be assigned to location")
		end
		return true
	end
end

