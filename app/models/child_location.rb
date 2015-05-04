class ChildLocation < ActiveRecord::Base
	#relationships
	belongs_to :child
	belongs_to :location

	#validations
	#validates :child_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  	#validates :location_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  	validate :child_is_not_already_assigned_to_location, on: :create
	

  	#trying to prevent child from being assigned to same location again
	private
	  def child_is_not_already_assigned_to_location
	    return true if self.location.nil? || self.child.nil?
	    unless ChildLocation.where(child_id: self.child_id, location_id: self.location_id).to_a.empty?
	      errors.add(:base, "Child already belongs to this location")
	    end
	  end
end
