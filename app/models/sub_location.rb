class SubLocation < ActiveRecord::Base
  belongs_to :location
  
  # Validations
  validates_presence_of :name
 
  # Scopes
  scope :alphabetical, -> { order("name") }
  
end
