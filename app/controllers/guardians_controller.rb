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
		@guardian = Guardian.new(guardian_params)
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
			params.require(:guardian).permit(:first_name, :last_name, :phone, :email, :user_id, :date_of_birth_two, :location_ids => [])
		end
end
