class Location < ActiveRecord::Base
  # Relationships
  has_many :programs
  has_many :child_locations, dependent: :destroy
  has_many :children, through: :child_locations
  has_many :guardian_locations, dependent: :destroy
  has_many :guardians, through: :guardian_locations
  has_many :assignments, dependent: :destroy
  has_many :instructors, through: :assignments
  has_many :sub_locations, dependent: :destroy

  # Validations
  validates_presence_of :name

  # Scopes
  scope :alphabetical, -> { order("name") }

  # Callbacks
  before_destroy :make_children_inactive, :make_instructors_inactive

  # Makes children inactive if this is their only location
  def make_children_inactive
    for child in self.children do
      if !child.locations.nil? and child.locations.length <= 1
        child.active = false
        child.save!
      end
    end
  end

  # Makes instructors and therefore user inactive if this is their only location
  def make_instructors_inactive
    for instructor in self.instructors do
      if !instructor.locations.nil? and instructor.locations.length <= 1
        instructor.user.active = false
        instructor.user.save!
      end
    end
  end
end
