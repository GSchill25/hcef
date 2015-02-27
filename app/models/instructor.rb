class Instructor < ActiveRecord::Base

	belongs_to :user
	has_many :assignments

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates_presence_of :user_id

	scope :alphabetical, -> { order('last_name', 'first_name')}

	private

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

