class Program < ActiveRecord::Base
  # Relationships
  belongs_to :location
  has_many :after_schools
  has_one :enrichment
  has_one :field_trip
  has_many :enrollments
  has_many :assignments
  has_many :children, through: :enrollments
  has_many :instructors, through: :assignments
  
  # Validations
  validates_presence_of :name
  validates_presence_of :program_type
  validates_inclusion_of :program_type, in: %w( enrichment after_school field_trip) #Test case_sensitivity
  #validates_date :start_date #In case they're putting programs in from old years
  #validates_date :end_date, on_or_after: :start_date

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :ascending, -> { order("start_date") }
  scope :descending, -> { order("start_date DESC") }
  scope :upcoming, -> { where("start_date > ?", Date.today) }
  scope :active, -> { where("end_date >= ?", Date.today) }
  scope :inactive, -> { where("end_date < ?", Date.today) }

  # Methods

  def by_location(loc_id)
    children = []
    ChildLocation.all.each do |c|
      if c.location_id == loc_id
        children << c.child
      end
    end
    return children
  end
end
