class AfterSchoolsController < ApplicationController
  before_action :set_after_school, only: [:show, :edit, :update, :destroy]

  def index
    @after_schools = AfterSchool.all
  end

  def show
  end

  def new
    @after_school = AfterSchool.new
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

  def destroy
    @after_school.destroy
    redirect_to locations_url, notice: "#{@after_school.date} has been destroyed"
  end

  private
    def set_after_school
      @after_school = AfterSchool.find(params[:id])
    end

    def after_school_params
      params.require(:after_school).permit(:program_id, :guardian_id, :date, :time_in, :time_out, :total_hours, :homework_time, :literacy_time, :technology_time, :reading_specialist_time, :goal)
    end
end