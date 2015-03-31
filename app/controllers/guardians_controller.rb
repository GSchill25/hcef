class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
  end

  def show
  end

  def new
  	@guardian = Guardian.new
  end

  def edit
  end

  def create
  		gp = guardian_params
  		gp[:location_ids][0] = gp[:location_ids][0].to_i-10000
  		#workaround for having checkboxes with the same id/value (increment by 10000)
		@guardian = Guardian.new(gp)
		if @guardian.save
			redirect_to new_child_path, notice: "#{@guardian.name} was added to the system"
		else
			render action: 'new'
		end
	end

	def update
		if @guardian.update(guardian_params)
			redirect_to @guardian, notice: "#{@guardian.name} has been updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@guardian.destory
		redirect_to guardians_url, notice: "#{@guardian.name} has been deleted"
	end

	private

		def set_guardian
			@guardian = Guardian.find(params[:id])
		end

		def guardian_params
			params.require(:guardian).permit(:first_name, :last_name, :phone, :email, :user_id, :date_of_birth, :location_ids => [])
		end
end
