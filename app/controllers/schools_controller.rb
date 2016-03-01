class SchoolsController < ApplicationController
	before_action :set_school, only: [:show, :edit, :update, :destroy]
	authorize_resource

	def index
	end

	def show
	end

	def new
		@school = School.new
	end

	def edit
	end

	def create
		@school = School.new(school_params)
		if @school.save
			redirect_to new_child_path, notice: "The school #{@school.name} was added to the system"
		else
			redirect_to new_child_path, alert: "The school #{@school.name} was not added to the system"
		end
	end

	def update
		if @school.update(school_params)
			redirect_to @school, notice: "The school #{@school.name} has been updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@school.destroy
		redirect_to dash_path, notice: "The school #{@school.name} has been deleted"
	end

	private

		def set_school
			@school = School.find(params[:id])
		end

		def school_params
			params.require(:school).permit(:name, :phone, :address_line_one, :address_line_two, :city, :state, :zip, :school_district_id)
		end
end
