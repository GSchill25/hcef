class Enrichment < ActiveRecord::Base
  # Relationships
  belongs_to :provider
  belongs_to :program
  has_many :enrichment_days, dependent: :destroy
  has_many :children, through: :enrichment_days

  # Validations
  validates_presence_of :length
  validates_numericality_of :length
  validates_date :event_date, allow_nil: false
  validates_presence_of :provider
end
