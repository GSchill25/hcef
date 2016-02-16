class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy, :instructor_active]
  authorize_resource

  def index
  	@instructors = Instructor.active.alphabetical
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
		  #this part checks to see if instructor was assigned a location, which is mandatory if their role is instructor, not admin
		  if @instructor.user.role == 'instructor' && params[:instructor][:location_ids].nil? 
		  	@instructor.errors.add(:base, "Instructor needs to be assigned to at least 1 location")
		  	format.html { render action: 'new' }
		  	format.json { render json: @instructor.errors.full_messages, status: :unprocessable_entity}
	      elsif @instructor.save
	        format.html { redirect_to @instructor, notice: 'Instructor was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @instructor }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @instructor.errors.full_messages, status: :unprocessable_entity }
	      end
    	end
	end

  def update
    if @instructor.user.role == 'instructor' && params[:instructor][:location_ids].nil? 
      @instructor.errors.add(:base, "Instructor needs to be assigned to at least 1 location")
      render action: 'edit'
    elsif @instructor.update(instructor_params)
      # Make instructor active if they have one or more locations
      if @instructor.locations.length > 0
        if !@instructor.is_active
          @instructor.user.active = true
          @instructor.user.save!
        end
      end

      redirect_to @instructor, notice: "#{@instructor.name} has been updated"
    else
      render action: 'edit'
    end
  end

	def destroy
		@instructor.destroy
		redirect_to dash_path, notice: "#{@instructor.name} has been deleted"
	end

	def instructor_active
	  	if @instructor.user.active==true
	  		@instructor.user.active=false
	  		@instructor.user.save
	  		redirect_to dash_path, notice: "#{@instructor.name} was made inactive"
	  	else
	  		@instructor.user.active=true
	  		@instructor.user.save
	  		redirect_to dash_path, notice: "#{@instructor.name} was made active"
	  	end
	end

	private

		def set_instructor
			@instructor = Instructor.find(params[:id])
		end

		def instructor_params
			params.require(:instructor).permit(:first_name, :last_name, :location_ids => [], user_attributes: [:id, :username, :password, :password_confirmation, :role])
		end
end
