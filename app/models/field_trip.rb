class FieldTrip < ActiveRecord::Base
  # Relationships
  belongs_to :program

  # Validations
  validates_presence_of :length
  validates_numericality_of :length
end
