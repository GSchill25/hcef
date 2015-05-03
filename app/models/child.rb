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
	scope :active, -> { where('active = ?', true)}



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
	    physical_time = 0
	    hands_on_time = 0
	    child_days = asprogram.after_schools.where("child_id = ?", self.id)
	    total_days = child_days.count
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

    if total_days!=0
      return [["Homework", homework_time/total_days], ["Literacy", literacy_time/total_days], ["Technology", technology_time/total_days], ["Reading Specialist", reading_specialist_time/total_days], ["Physical Activity", physical_time/total_days], ["Hands On Time", hands_on_time/total_days]]
    else
      return nil
    end
  end

  def name
  	return "#{self.first_name} #{self.last_name}"
  end

	
end
