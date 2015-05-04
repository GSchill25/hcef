class Instructor < ActiveRecord::Base

	has_one :user
	has_many :assignments
	has_many :locations, through: :assignments
	
	accepts_nested_attributes_for :user, reject_if: lambda { |user| user[:username].blank? or user[:password].blank? }

	validates :first_name, presence: true
	validates :last_name, presence: true

	scope :alphabetical, -> { order('last_name', 'first_name')}
	scope :active, -> {joins(:user).where("active = ?", true)}


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
end

