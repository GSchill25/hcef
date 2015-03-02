class SchoolsController < ApplicationController
	before_action :set_school, only: [:show, :edit, :update, :destroy]

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
			redirect_to @school, notice: "The school #{@school.name} was added to the system"
		else
			render action: 'new'
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
		@school.destory
		redirect_to schools_url, notice: "The school #{@school.name} has been deleted"
	end

	private

		def set_school
			@school = School.find(params[:id])
		end

		def school_params
			params.require(:school).permit(:name, :phone, :address_line_one, :address_line_two, :city, :state, :zip)
		end
end
