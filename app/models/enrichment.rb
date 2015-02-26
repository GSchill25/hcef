class Enrichment < ActiveRecord::Base
  # Relationships
  has_one :provider
  has_one :program

  # Validations
  validates_numericality_of :length, presence: true
end
