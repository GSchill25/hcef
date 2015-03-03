class Enrollment < ActiveRecord::Base
	belongs_to :child
	belongs_to :program
end
