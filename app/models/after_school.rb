class AfterSchool < ActiveRecord::Base
  # Relationships
  has_one :program
  
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
end