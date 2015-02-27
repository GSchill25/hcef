class AfterSchool < ActiveRecord::Base
  # Relationships
  belongs_to :program
  #belongs_to :parent?
  
  # Validations
  validates_presence_of :date
  validates_date :date, allow_nil: false
  validates_presence_of :time_in
  validates_presence_of :time_out
  #validates_format_of :time_in, with: /[0-9]{1,4}/[0-9]{1,2}/[0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}/, :allow_nil => false, :allow_blank => false
  #validates_format_of :time_out, with: /[0-9]{1,4}/[0-9]{1,2}/[0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}/, :allow_nil => false, :allow_blank => false
  #validates :time_out, after: :time_in
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
