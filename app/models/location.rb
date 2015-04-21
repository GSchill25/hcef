class Location < ActiveRecord::Base
  # Relationships
  has_many :programs
  has_many :child_locations
  has_many :children, through: :child_locations
  has_many :guardian_locations
  has_many :guardians, through: :guardian_locations
<<<<<<< HEAD
  has_many :assignments
  has_many :instructors, through: :assignments
=======
  has_many :sub_locations
>>>>>>> 1d20254d3e5a4d1d2bd31bb6a5372abd8ad82453
  
  # Validations
  validates_presence_of :name
  #validates_presence_of :address_line_one
  #validates_presence_of :city
  #validates_presence_of :state
  #validates_presence_of :zip
  #validates_presence_of :phone
  #validates_format_of :zip, with: /\A(\d{5}(-\d{4})?)\z/, message: "should be in the form 12345 or 12345-1234"
  #validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be in the form 412 456 7890"

  # Scopes
  scope :alphabetical, -> { order("name") }

end
