class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy, :child_active]
  authorize_resource

  def index
    @children = Child.all.alphabetical.paginate(:page => params[:page], :per_page => 30)
  end

  def show
  end

  def new
  	@child = Child.new
  	@guardian = Guardian.new
  	@school = School.new
  	@locations = Location.all
  	@locs = Location.all
  end

  def edit
  	@locations = Location.all
  end

  def child_active
  	if @child.active==true
  		@child.active=false
  		@child.save
  		redirect_to dash_path, notice: "#{@child.name} was made inactive"
  	else
  		@child.active=true
  		@child.save
  		redirect_to dash_path, notice: "#{@child.name} was made active"
  	end
  end

  def create
  		@locations = Location.all
		@child = Child.new(child_params)
		if @child.save
			redirect_to programs_url, notice: "#{@child.name} was added to the system"
		else
			redirect_to new_child_path
		end
	end

	def update
		if @child.update(child_params)
			redirect_to @child, notice: "#{@child.name} has been updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@child.destory
		redirect_to children_url, notice: "#{@child.name} has been deleted"
	end

	private

		def set_child
			@child = Child.find(params[:id])
		end

		def child_params
			params.require(:child).permit(:first_name, :last_name, :date_of_birth, :grade, :school_id, :guardian_id, :active, :location_ids => [])
		end
end
