class EnrichmentsController < ApplicationController
	before_action :set_enrichment, only: [:show, :edit, :update, :destroy]
	authorize_resource

	def index
	end

	def show
		# Currently no view for this, so redirect to program's page
		redirect_to program_path(@field_trip.program)
	end

	def new
		@enrichment = Enrichment.new
		get_program_and_children
		@enrichment.program = @program

		# TODO: What was this about?
		# if !params[:program_id].nil?
		# 	@program = Program.find(params[:program_id])
		# 	@enrichment.program = @program
		# 	@enrichment.save
		# 	@children = @program.by_location(@program.location_id)
		# end
	end

	def edit
		get_program_and_children
	end

	def create
		@enrichment = Enrichment.new(enrichment_params)
		if @enrichment.save
			redirect_to program_path(@enrichment.program), notice: "The enrichment was added to the system"
		else
			get_program_and_children
			render action: 'new'
		end
	end

	def update
		if @enrichment.update(enrichment_params)
			redirect_to program_path(@enrichment.program), notice: "The enrichment has been updated"
		else
			get_program_and_children
			render action: 'edit'
		end
	end

	def destroy
		@enrichment.destroy
		redirect_to enrichments_url, notice: "The enrichment has been deleted"
	end

	private

		def set_enrichment
			@enrichment = Enrichment.find(params[:id])
		end

		# Obtain values for @program and @children (must be called after @enrichment has a value)
		def get_program_and_children
			# Attempt to get program from enrichment
			@program = @enrichment.program rescue nil

			# Attempt to find program from parameter if we haven't already found it
			@program ||= Program.find(params[:program_id]) rescue nil

			@children = @program.by_location(@program.location_id) rescue Child.none
		end


		def enrichment_params
			params.require(:enrichment).permit(:event_date, :length, :notes, :provider_id, :program_id,
				:child_ids => [])
		end
end
