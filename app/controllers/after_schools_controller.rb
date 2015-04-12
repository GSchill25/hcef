class AfterSchoolsController < ApplicationController
  before_action :set_after_school, only: [:show, :edit, :update, :destroy]
  # Turn off protect_from_forgery for these actions
  protect_from_forgery :except => [:update_by_id, :update_sign_in_by_id, :load_data]
  authorize_resource

  def index
    @after_schools = AfterSchool.all
  end

  def show
  end

  def new
    @program_id = params[:program_id]
    @program = Program.find(@program_id)
    @after_school = AfterSchool.new
    @data = []
    @data_sign_in = []
    @children = @program.children
    @children_ids = []
    for child in @children
      @data.push([child.name] + [0]*4 + [""])
      @data_sign_in.push([child.name] + [""] + [""])
      @children_ids.push(child.id)
    end
    if cannot? :read, @program
      redirect_to "public/404.html"
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
    program_id = params["program_id"]
    child_id = params[:id]
    date = Date.strptime(params["date"],"%m/%d/%Y")
    col = params["col"]
    value = params["value"]

    @after_school = AfterSchool.find_or_initialize_by(program_id: program_id, child_id: child_id, date: date)
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
  
  def update_sign_in_by_id
    program_id = params["program_id"]
    child_id = params[:id]
    date = Date.strptime(params["date"],"%m/%d/%Y")
    col = params["col"]
    value = params["value"]

    @after_school = AfterSchool.find_or_initialize_by(program_id: program_id, child_id: child_id, date: date)
    # Note on methods:
    # update_attribute does NOT validate
    # update           does validate
    case col
    when 1
      @after_school.update_attribute(:time_in, value)
      if !@after_school.time_out.nil?
        total_minutes = ((@after_school.time_out - @after_school.time_in) / 60).to_i # minutes
        #TODO migrate total_hours => total_minutes
        if total_minutes > 0
          @after_school.update_attribute(:total_hours, total_minutes)
        end
      end
    when 2
      @after_school.update_attribute(:time_out, value)
      # update totalHours
      if !@after_school.time_in.nil?
        total_minutes =( (@after_school.time_out - @after_school.time_in) / 60).to_i # minutes
        if total_minutes > 0
          @after_school.update_attribute(:total_hours, total_minutes)
        end
      end
    end

    # Don't need to return anything
    head :ok
  end

  def load_data
    data = params["data"]
    data_sign_in = params["data_sign_in"]
    program_id = params["program_id"]
    children_ids = params["children_ids"]
    date = Date.strptime(params["date"],"%m/%d/%Y")
    
    # Look at every child to check if a record exists
    for index in 0..children_ids.count-1
      child_id = children_ids[index]
      record = AfterSchool.where(:program_id=>program_id).where(:child_id=>child_id).where(:date=>date).first
      
      # If the record exists, give the row this data
      if !record.nil?
        p record

        if record.homework_time.nil?
          data[index][1] = 0
        else
          data[index][1] = record.homework_time
        end
        if record.literacy_time.nil?
          data[index][2] = 0
        else
          data[index][2] = record.literacy_time
        end
        if record.technology_time.nil?
          data[index][3] = 0
        else
          data[index][3] = record.technology_time
        end
        if record.reading_specialist_time.nil?
          data[index][4] = 0
        else
          data[index][4] = record.reading_specialist_time
        end
        if record.goal.nil?
          data[index][5] = ""
        else
          data[index][5] = record.goal
        end

        if record.time_in.nil?
          data_sign_in[index][1] = ""
        else
          hour = record.time_in.hour
          minutes = record.time_in.min 
          minutes = minutes < 10 ? "0#{minutes}" : minutes;
          data_sign_in[index][1] = "#{hour}:#{minutes}"
        end
        if record.time_out.nil?
          data_sign_in[index][2] = ""
        else
          hour = record.time_in.hour
          minutes = record.time_in.min 
          minutes = minutes < 10 ? "0#{minutes}" : minutes;
          data_sign_in[index][2] = "#{hour}:#{minutes}"
        end

      # If the record doesn't exist, set the row to initial, zero'd values
      else
        data[index] = [data[index][0]] + [0]*4 + [""]
        
        data_sign_in[index][1] = ""
        data_sign_in[index][2] = ""
      end
    end
    
    render :json => {data: data, data_sign_in: data_sign_in}
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
