class FieldTrip < ActiveRecord::Base
  # Relationships
  belongs_to :program
  belongs_to :provider

  # Validations
  validates_presence_of :length
  validates_numericality_of :length
end
