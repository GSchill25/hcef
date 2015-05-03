class Program < ActiveRecord::Base
  # Relationships
  belongs_to :location
  has_many :after_schools
  has_many :enrichments
  has_many :field_trips
  has_many :enrollments
  has_many :children, through: :enrollments

  accepts_nested_attributes_for :enrichments, reject_if: lambda { |enr| enr[:length].blank? }
  accepts_nested_attributes_for :field_trips, reject_if: lambda { |ft| ft[:length].blank? }

  # Validations
  validates_presence_of :name
  validates_presence_of :program_type
  validates_inclusion_of :program_type, in: %w( enrichment after_school field_trip) #Test case_sensitivity
  validates_presence_of :start_date #In case they're putting programs in from old years
  #validates_presence_of :end_date #on_or_after: :start_date

  # Scopes
  scope :alphabetical, -> { order("name") }
  scope :ascending, -> { order("start_date") }
  scope :descending, -> { order("start_date DESC") }
  scope :upcoming, -> { where("start_date > ?", Date.today) }
  scope :active, -> { where("end_date >= ?", Date.today) }
  scope :inactive, -> { where("end_date < ?", Date.today) }

  # Methods

  #this method shows children based on the location that they are assigned to
  def by_location(loc_id)
    children = []
    ChildLocation.all.each do |c|
      if c.location_id == loc_id
        children << c.child
      end
    end
    return children
  end

  #this method shows the overall average time of after school program
  def average_time
    homework_time = 0
    literacy_time = 0
    technology_time = 0
    reading_specialist_time = 0
    total_days = self.after_schools.count
    self.after_schools.each do |a|
      #just add 0 if the students time is nil for that particular activity
      homework_time += a.homework_time || 0
      literacy_time += a.literacy_time || 0
      technology_time += a.technology_time || 0
      reading_specialist_time += a.reading_specialist_time || 0
    end

    if total_days!=0
      return [["Homework", homework_time/total_days], ["Literacy", literacy_time/total_days], ["Technology", technology_time/total_days], ["Reading Specialist", reading_specialist_time/total_days]]
    else
      return [["Homework", 0], ["Literacy", 0], ["Technology", 0], ["Reading Specialist", 0]]
    end
  end

  #returns all days recorded in program for afterschool programs
  def program_days
    student_days=AfterSchool.for_program(self.id)
    days=student_days.group_by(&:date).sort
    dates=[]
    for i in 0..days.length-1
      dates << [days[i][0], days[i][1].count]
    end
    return dates
  end

end


