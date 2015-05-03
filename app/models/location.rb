class Location < ActiveRecord::Base
  # Relationships
  has_many :programs
  has_many :child_locations
  has_many :children, through: :child_locations
  has_many :guardian_locations
  has_many :guardians, through: :guardian_locations
  has_many :assignments
  has_many :instructors, through: :assignments
  has_many :sub_locations
  
  # Validations
  validates_presence_of :name

  # Scopes
  scope :alphabetical, -> { order("name") }

end
