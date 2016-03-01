class SchoolDistrict < ActiveRecord::Base
	has_many :schools, dependent: :destroy
	
	validates_presence_of :name
end
