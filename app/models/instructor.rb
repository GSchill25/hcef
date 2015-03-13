class Instructor < ActiveRecord::Base

	belongs_to :user, :dependent => :destroy, :foreign_key => 'user_id'
	has_many :assignments
	has_many :programs, through: :assignments
	accepts_nested_attributes_for :user, reject_if: lambda { |user| user[:username].blank? || user[:password].blank? || user[:role].blank?}, allow_destroy: true

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

