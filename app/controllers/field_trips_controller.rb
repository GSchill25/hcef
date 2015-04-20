class FieldTripsController < ApplicationController
	before_action :set_field_trip, only: [:show, :edit, :update, :destroy]
	authorize_resource

	def index
	end

	def show
	end

	def new
		@field_trip = FieldTrip.new
	end

	def edit
	end

	def create
		@field_trip = FieldTrip.new(field_trip_params)
		if @field_trip.save
			redirect_to new_field_trip_path, notice: "The field trip  was added to the system"
		else
			render action: 'new'
		end
	end

	def update
		if @field_trip.update(field_trip_params)
			redirect_to @field_trip, notice: "The field trip has been updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@field_trip.destory
		redirect_to field_trips_url, notice: "The field trip has been deleted"
	end

	private

		def set_field_trip
			@field_trip = field_trip.find(params[:id])
		end

		def field_trip_params
			params.require(:field_trip).permit(:length, :notes, :provider_id, :program_id, :child_ids => [])
		end
end
