class FieldTrip < ActiveRecord::Base
  # Relationships
  belongs_to :program

  # Validations
  validates_numericality_of :length, presence: true
end
