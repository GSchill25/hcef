class StaticController < ApplicationController
  def home
  end

  def login
  end

  def master_view_new
    @locations = Location.all.alphabetical
  end

  def master_view_submit
    location_ids = params["locations"].map(&:to_i)
    locations = Location.all.alphabetical.reject!.with_index { |l, i| !location_ids.include? i }
    render :json => {locations: locations} 
  end

  def create_child
  end

end
