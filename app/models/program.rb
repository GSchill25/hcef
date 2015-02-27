class Program < ActiveRecord::Base
  # Relationships
  belongs_to :location
  has_one :enrichment
  has_many :after_schools
  has_one :field_trip
  
  # Validations
  validates_presence_of :name
  validates_presence_of :type
  validates_inclusion_of :type %w( enrichment after_school field_trip) #Test case_sensitivity
  validates_date :start_date #In case they're putting programs in from old years
  validates_date :end_date, on_or_after: :start_date

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :ascending, -> { order("start_date") }
  scope :descending, -> { order("start_date DESC") }
  scope :upcoming, -> { where("start_date > ?", Date.today) }
  scope :active, -> { where("end_date >= ?" Date.today) }
  scope :inactive, -> { where("end_date < ?" Date.today) }
end
