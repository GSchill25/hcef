class Enrichment < ActiveRecord::Base
  # Relationships
  belongs_to :provider
  belongs_to :program
  has_many :enrichment_days
  has_many :children, through: :enrichment_days

  # Validations
  validates_presence_of :length
  validates_numericality_of :length
end
