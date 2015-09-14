class FieldTripsController < ApplicationController
	before_action :set_field_trip, only: [:show, :edit, :update, :destroy]
	authorize_resource

	def index
	end

	def show
		# Currently no view for this, so redirect to program's page
		redirect_to program_path(@field_trip.program)
	end

	def new
		@field_trip = FieldTrip.new
		get_program_and_children
		@field_trip.program = @program

		# TODO: What was this about?
		# if !params[:program_id].nil?
		# 	@program = Program.find(params[:program_id])
		# 	@field_trip.program = @program
		# 	@field_trip.save
		# 	@children = @program.by_location(@program.location_id)
		# end
	end

	def edit
		get_program_and_children
	end

	def create
		@field_trip = FieldTrip.new(field_trip_params)
		if @field_trip.save
			redirect_to program_path(@field_trip.program), notice: "The field trip was added to the system"
		else
			get_program_and_children
			render action: 'new'
		end
	end

	def update
		if @field_trip.update(field_trip_params)
			redirect_to program_path(@field_trip.program), notice: "The changes to field trip were saved"
		else
			get_program_and_children
			render action: 'edit'
		end
	end

	def destroy
		@field_trip.destory
		redirect_to field_trips_url, notice: "The field trip has been deleted"
	end

	private

		def set_field_trip
			@field_trip = FieldTrip.find(params[:id])
		end

		# Obtain values for @program and @children (must be called after @field_trip has a value)
		def get_program_and_children
			# Attempt to get program from field_trip
			@program = @field_trip.program rescue nil

			# Attempt to find program from parameter if we haven't already found it
			@program ||= Program.find(params[:program_id]) rescue nil
			@children = @program.by_location(@program.location_id) rescue Child.none
		end

		def field_trip_params
			params.require(:field_trip).permit(:event_date, :length, :notes, :provider_id, :program_id,
				:child_ids => [])
		end
end
