class AfterSchoolsController < ApplicationController
  load_and_authorize_resource
  before_action :set_after_school, only: [:show, :edit, :update, :destroy]
  # Turn off protect_from_forgery for this action
  protect_from_forgery except: :update_by_id

  def index
    @after_schools = AfterSchool.all
  end

  def show
  end

  def new
    program_id = params[:program_id]
    @program = Program.find(program_id)
    @after_school = AfterSchool.new
    @data = []
    @children = @program.children
    @children_ids = []
    # Change to child for this
    for child in @children
      @data.push([child.name] + [0]*4 + [""])
      @children_ids.push(child.id)
    end
  end

  def edit
  end

  def create
    @after_school = AfterSchool.new(after_school_params)
    if @after_school.save
      redirect_to @after_school, notice: "#{@after_school.date} was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @after_school.save
      redirect_to @after_school, notice: "#{@after_school.date} has been updated."
    else
      render action: "edit"
    end
  end

  def update_by_id
    #@after_school = .find_or_initialize_by(name: "Roger")
    child_id = params[:id]
    date = Date.strptime(params["date"],"%m/%d/%Y")
    col = params["col"]
    value = params["value"]

    @after_school = AfterSchool.find_or_initialize_by(child_id: child_id, date: date)
    # Note on methods:
    # update_attribute does NOT validate
    # update           does validate
    case col
    when 1
      @after_school.update_attribute(:homework_time, value)
    when 2
      @after_school.update_attribute(:literacy_time, value)
    when 3
      @after_school.update_attribute(:technology_time, value)
    when 4
      @after_school.update_attribute(:reading_specialist_time, value)
    when 5
      @after_school.update_attribute(:goal, value)
    end

    # Don't need to return anything
    head :ok
  end

  def destroy
    @after_school.destroy
    redirect_to after_schools_url, notice: "#{@after_school.date} has been destroyed"
  end

  private
    def set_after_school
      @after_school = AfterSchool.find(params[:id])
    end

    def after_school_params
      params.require(:after_school).permit(:program_id, :child_id, :date, :time_in, :time_out, :total_hours, :homework_time, :literacy_time, :technology_time, :reading_specialist_time, :goal)
    end
end
