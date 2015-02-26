class Guardian < ActiveRecord::Base
	#relationships
	has_many :children

	#validations
	validates_presence_of :first_name, :last_name, :phone

end
