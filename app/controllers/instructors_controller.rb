class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]

  def index
  	@instructors = Instructor.all
  end

  def show
  	
  end

  def new
  	@instructor = Instructor.new
  end

  def edit
  end

  def create
		@instructor = Instructor.new(instructor_params)
		if @instructor.save
			redirect_to @instructor, notice: "#{@instructor.name} was added to the system"
		else
			render action: 'new'
		end
	end

	def update
		if @instructor.update(instructor_params)
			redirect_to @instructor, notice: "#{@instructor.name} has been updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@instructor.destory
		redirect_to instructors_url, notice: "#{@instructor.name} has been deleted"
	end

	private

		def set_instructor
			@instructor = instructor.find(params[:id])
		end

		def instructor_params
			params.require(:instructor).permit(:first_name, :last_name)
		end
end
