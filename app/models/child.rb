class Child < ActiveRecord::Base
	#relationships
	belongs_to :school
	belongs_to :guardian
	has_many :enrollments
	has_many :programs, through: :enrollments
	has_many :child_locations
	has_many :locations, through: :child_locations
	has_many :field_trip_days
	has_many :field_trips, through: :field_trip_days
	has_many :enrichment_days
	has_many :enrichments, through: :enrichment_days

	#validations
	validates_presence_of :first_name, :last_name, :date_of_birth
	validates_date :date_of_birth, :before => lambda { Date.today }, on: :create


	#scopes
	scope :alphabetical, -> { order('last_name', 'first_name')}


  #calculates the average time of the activities for a child
  #returns nil if the child does not have any after_school recorded
  def average_activity_time
  	asprogram = nil
  	self.programs.each do |p|
  		if p.program_type == "after_school"
  			asprogram = p
  		end
  	end
  	if asprogram.nil?
  		return nil
  	else
	    homework_time = 0
	    literacy_time = 0
	    technology_time = 0
	    reading_specialist_time = 0
	    total_days = asprogram.after_schools.count
	    asprogram.after_schools.each do |a|
	      #just add 0 if the students time is nil for that particular activity
	      homework_time += a.homework_time || 0
	      literacy_time += a.literacy_time || 0
	      technology_time += a.technology_time || 0
	      reading_specialist_time += a.reading_specialist_time || 0
	    end
	end

    if total_days!=0
      return [["Homework", homework_time/total_days], ["Literacy", literacy_time/total_days], ["Technology", technology_time/total_days], ["Reading Specialist", reading_specialist_time/total_days]]
    else
      return nil
    end
  end

  def name
  	return "#{self.first_name} #{self.last_name}"
  end

	
end
