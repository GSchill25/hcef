class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
  	@instructors = Instructor.all
  end

  def show
  end

  def new
  	@instructor = Instructor.new
  	@instructor.build_user
  	@locations = Location.all
  end

  def edit
  	if @instructor.user.nil?
        @instructor.build_user
    end
  end

  def create
		@instructor = Instructor.new(instructor_params)
		respond_to do |format|
	      if @instructor.save
	        format.html { redirect_to @instructor, notice: 'Instructor was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @instructor }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @instructor.errors, status: :unprocessable_entity }
	      end
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
			@instructor = Instructor.find(params[:id])
		end

		def instructor_params
			params.require(:instructor).permit(:first_name, :last_name, :location_ids => [], user_attributes: [:id, :username, :password, :password_confirmation, :role])
		end
end
