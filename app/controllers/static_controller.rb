class StaticController < ApplicationController
  def home
  end

  def login
  end

  def master_view_new
    @locations = Location.all.alphabetical
  end

  def master_view_submit
    location_ids = params["locations"]
    if !location_ids.nil? 
      location_ids.map!(&:to_i)
      locations = Location.all.alphabetical.reject!.with_index { |l, i| !location_ids.include? i }
    end
    render :json => {locations: locations} 
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
    @children = Child.all.alphabetical.paginate(:page => params[:page], :per_page => 10)
    @instructors = Instructor.all.alphabetical.paginate(:page => params[:page], :per_page => 10)
  end

end
