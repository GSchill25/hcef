class Guardian < ActiveRecord::Base
	#add date of birth to uniquely identify

	#relationships
	has_many :children

	#validations
	validates_presence_of :first_name, :last_name, :phone

	#methods
	def name
		"#{first_name} #{last_name}"
	end

end
