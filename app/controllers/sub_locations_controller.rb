class SubLocationsController < ApplicationController
  #load_and_authorize_resource
  before_action :set_sub_location, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :update_by_id

  def index
    @sub_locations = SubLocation.all
  end

  def show
  end

  def new
    location_id = params[:location_id]
    @sub_location = SubLocation.new(:location_id => location_id)
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
    if @sub_location.save
      redirect_to @sub_location, notice: "#{@sub_location.name} has been updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @sub_location.destroy
    redirect_to sub_locations_url, notice: "#{@sub_location.name} has been destroyed"
  end

  private
    def set_sub_location
      @sub_location = SubLocation.find(params[:id])
    end

    def sub_location_params
      params.require(:sub_location).permit(:location_id, :name, :address_line_one, :address_line_two, :city, :state, :zip, :phone)
    end
end