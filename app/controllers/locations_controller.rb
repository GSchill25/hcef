class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location, notice: "#{@location.name} was successfully created."
    else
      render action: "new"
    end
  end

  def update
		if @location.update(location_params)
			redirect_to @location, notice: "#{@location.name} has been updated"
		else
			render action: "edit"
		end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: "#{@location.name} has been destroyed"
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :address_line_one, :address_line_two, :city, :state, :zip, :phone)
    end
end
