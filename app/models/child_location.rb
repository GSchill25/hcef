class ChildLocation < ActiveRecord::Base
	#relationships
	belongs_to :child
	belongs_to :location

	
end
