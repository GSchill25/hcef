class GuardianLocation < ActiveRecord::Base
	belongs_to :guardian
	belongs_to :location
end
