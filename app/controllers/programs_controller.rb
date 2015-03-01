class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  def index
    @programs = Program.all
  end

  def show
  end

  def new
    @program = Program.new
  end

  def edit
  end

  def create
    @program = Program.new(program_params)
    if @program.save
      redirect_to @program, notice: "#{@program.name} was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @program.update(program_params)
			redirect_to @program, notice: "#{@program.name} has been updated"
    else
      render action: "edit"
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_url, notice: "#{@program.name} has been destroyed"
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:name, :program_type, :start_date, :end_date, :location_id)
    end
end
