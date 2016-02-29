class Child < ActiveRecord::Base
	#relationships
	belongs_to :school
	belongs_to :guardian
	has_many :enrollments, :dependent => :destroy
	has_many :programs, through: :enrollments
	has_many :child_locations, :dependent => :destroy
	has_many :locations, through: :child_locations
	has_many :field_trip_days, :dependent => :destroy
	has_many :field_trips, through: :field_trip_days
	has_many :enrichment_days, :dependent => :destroy
	has_many :enrichments, through: :enrichment_days

  # TODO: Temporary, may need to change if we refactor AfterSchool model
  has_many :after_schools, :dependent => :destroy


	#validations
	validates_presence_of :first_name, :last_name, :date_of_birth
	validates_date :date_of_birth, :before => lambda { Date.today }, on: :create

	#scopes
	scope :alphabetical, -> { order('last_name', 'first_name')}
	scope :active, -> { where('active = ?', true)}



  #calculates the total time of the activities for a child
  #returns nil if the child does not have any after_school recorded

  def total_time
    asprogram = self.programs.each.select { |prog| prog.program_type == "after_school" }
    if asprogram.nil?
      return nil
    else
      total_time = 0
      asprogram.each do |asp|
        child_days = asp.after_schools.where("child_id = ?", self.id)
        child_days.each do |a|
          total_time += a.total_time
        end
      end
    end
    return total_time
  end

  #calculates the total time of the activities for a child
  #returns nil if the child does not have any after_school recorded
  def average_activity_time
  	asprogram = self.programs.each.select { |prog| prog.program_type == "after_school" }
  	if asprogram.nil?
  		return nil
  	else
	    homework_time = 0
	    literacy_time = 0
	    technology_time = 0
	    reading_specialist_time = 0
	    physical_time = 0
	    hands_on_time = 0
      total_days = 0
      asprogram.each do |asp|
	     child_days = asp.after_schools.where("child_id = ?", self.id)
	     total_days += child_days.count
  	    child_days.each do |a|
  	      #just add 0 if the students time is nil for that particular activity
  	      homework_time += a.homework_time || 0
  	      literacy_time += a.literacy_time || 0
  	      technology_time += a.technology_time || 0
  	      reading_specialist_time += a.reading_specialist_time || 0
  	      physical_time += a.physical_activity || 0
  	      hands_on_time += a.hands_on_activity || 0
        end
	    end
	end

    if total_days != 0
      return [["Homework", homework_time/total_days], ["Literacy", literacy_time/total_days], ["Technology", technology_time/total_days], ["Reading Specialist", reading_specialist_time/total_days], ["Physical Activity", physical_time/total_days], ["Hands On Time", hands_on_time/total_days]]
    else
      return nil
    end
  end

  def name
  	return "#{self.first_name} #{self.last_name}"
  end
end
