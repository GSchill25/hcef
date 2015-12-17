class FieldTrip < ActiveRecord::Base
  # Relationships
  belongs_to :program
  belongs_to :provider
  has_many :field_trip_days
  has_many :children, through: :field_trip_days


  # Validations
  validates_presence_of :length
  validates_numericality_of :length
  validates_date :event_date, allow_nil: false
  validates_presence_of :provider
end
