class Guardian < ActiveRecord::Base
	#add date of birth to uniquely identify

	#relationships
	has_many :children
	has_many :guardian_locations
	has_many :locations, through: :guardian_locations

	#validations
	validates_presence_of :first_name, :last_name, :phone, :email
	validates_date :date_of_birth, :before => lambda { Date.today }, on: :create
	validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-. ]\d{4})\z/, message: "should be 10 digits"
    validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"

	#scopes
	scope :alphabetical, -> { order('last_name', 'first_name')}

	#methods
	def name
		"#{first_name} #{last_name}"
	end

end
