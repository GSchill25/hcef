class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  	@child = Child.new
  end

  def edit
  end

  def create
		@child = Child.new(child_params)
		if @child.save
			redirect_to @child, notice: "#{@child.name} was added to the system"
		else
			render action: 'new'
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

		def set_school
			@child = Child.find(params[:id])
		end

		def school_params
			params.require(:child).permit(:first_name, :last_name, :date_of_birth, :grade, :school_id, :guardian_id, :active)
		end
end
