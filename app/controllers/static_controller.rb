class StaticController < ApplicationController
  def home
  end

  def login
  end

  def master_view_new
    @locations = Location.all.alphabetical
  end

  def create_child
  end

end
