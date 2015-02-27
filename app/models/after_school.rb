class AfterSchool < ActiveRecord::Base
  # Relationships
  belongs_to :program
  #belongs_to :parent?
  
  # Validations
  validates_date :date, presence: true
  validates_timestamp :time_in
  validates_timestamp :time_out, after: :time_in
  validates_numericality_of :total_hours, greater_than_or_equal_to: 0
=begin
  validates_time :homework_time,
  :literacy_time
  :technology_time
=end

  # Scopes
  scope :ascending, -> { order("date") }
  scope :descending, -> { order("date DESC") }
end
