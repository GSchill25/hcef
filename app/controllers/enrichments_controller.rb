class EnrichmentsController < ApplicationController
	before_action :set_enrichment, only: [:show, :edit, :update, :destroy]
	authorize_resource

	def index
	end

	def show
	end

	def new
		@enrichment = Enrichment.new
		if !params[:program_id].nil?
			@program = Program.find(params[:program_id])
			@enrichment.program = @program
			@enrichment.save
			@children = @program.by_location(@program.location_id)
		end
	end

	def edit
	end

	def create
		@enrichment = Enrichment.new(enrichment_params)
		if @enrichment.save
			redirect_to program_path(@enrichment.program), notice: "The enrichment was added to the system"
		else
			render action: 'new'
		end
	end

	def update
		if @enrichment.update(enrichment_params)
			redirect_to @enrichment, notice: "The enrichment has been updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@enrichment.destory
		redirect_to enrichments_url, notice: "The enrichment has been deleted"
	end

	private

		def set_enrichment
			@enrichment = Enrichment.find(params[:id])
		end

		def enrichment_params
			params.require(:enrichment).permit(:length, :notes, :provider_id, :program_id, :child_ids => [])
		end
end
