class SchoolDistrict < ActiveRecord::Base
	has_many :schools
	validates_presence_of :name
end
