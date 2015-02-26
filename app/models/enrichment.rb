class Enrichment < ActiveRecord::Base
  # Relationships
  has_one :provider
  has_one :program

  # Validations
  validates_presence_of :length
end
