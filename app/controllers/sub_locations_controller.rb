class SubLocationsController < ApplicationController
  before_action :set_sub_location, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @sub_locations = SubLocation.all
  end

  def show
  end

  def new
    @sub_location = SubLocation.new
  end

  def edit
  end

  def create
    @sub_location = SubLocation.new(sub_location_params)
    if @sub_location.save
      redirect_to @sub_location, notice: "#{@sub_location.name} was successfully created."
    else
      render action: "new"
    end
  end

  def update
		if @sub_location.update(sub_location_params)
			redirect_to @sub_location, notice: "#{@sub_location.name} has been updated"
		else
			render action: "edit"
		end
  end

  def destroy
    @sub_location.destroy
    redirect_to locations_url, notice: "#{@sub_location.name} has been destroyed"
  end

  private
    def set_sub_location
      @sub_location = SubLocation.find(params[:id])
    end

    def sub_location_params
      params.require(:sub_location).permit(:name, :address_line_one, :address_line_two, :city, :state, :zip, :phone, :location_id)
    end
end
