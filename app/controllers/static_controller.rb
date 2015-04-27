class StaticController < ApplicationController
  def home
  end

  def login
  end

  def master_view_new
    @locations = Location.all.alphabetical
  end

  def master_view_submit
    location_indices = params["locations"]
    if !location_indices.nil? 
      # Cast location_indices to integers
      location_indices.map!(&:to_i)
      # Rejects all locations that are in the ith index spot of the array
      allLocations = Location.all.alphabetical
      locations = allLocations.reject!.with_index { |l, i| !location_indices.include? i }
      # The case where all locations are selected, so reject! will return nil since there is no change from allLocaitons
      locations = allLocations if locations.nil?
      after_schools = []
      enrichments = []
      field_trips = []
      locations.each do |l|
        l.programs.each do |p|
          if p.program_type == 'after_school'
            after_schools << p
          elsif p.program_type == 'enrichment'
            enrichments << p
          elsif p.program_type == 'field_trip'
            field_trips << p
          end
        end
      end
    end
    render :json => {locations: locations, after_schools: after_schools, enrichments: enrichments, field_trips: field_trips} 
  end

  def create_child
  end

  def admin_dash
    @student_count = Child.all.count
    @program_count = Program.all.count
    @afterschool = Program.where("program_type=?", "after_school").count
    @enrichment = Program.where("program_type=?", "enrichment").count
    @field_trip = Program.where("program_type=?", "field_trip").count
    @location_count = Location.all.count
    @children = Child.all.alphabetical.paginate(:page => params[:children_page], :per_page => 10)
    @instructors = Instructor.all.alphabetical.paginate(:page => params[:instructors_page], :per_page => 10)
    @locations = Location.all.alphabetical.paginate(:page => params[:locations_page], :per_page => 10)
    @schools = School.all.paginate(:page => params[:schools_page], :per_page => 10)
  end

end
