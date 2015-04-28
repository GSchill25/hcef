class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :show_day, :edit, :update, :destroy]
  authorize_resource

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all.descending.paginate(:page => params[:page], :per_page => 10)
  end


  # GET /programs/1
  # GET /programs/1.json
  def show
    @average_times = @program.average_time
    @days=AfterSchool.for_program(@program.id).ascending
    if @program.program_days.count > 0
      @dates = @program.program_days.paginate(:page => params[:dates_page], :per_page => 10)
    end
    if !@program.field_trips.nil?
      @info = @program.field_trips
    end

    if !@program.enrichments.nil?
      @enrich_info = @program.enrichments
    end

    @children = @program.children.alphabetical.paginate(:page => params[:children_page], :per_page => 10)
  end

  def show_day
    @average_times = @program.average_time
    @days=AfterSchool.for_program(@program.id).for_date(params[:date]).ascending
  end

  # GET /programs/new
  def new
    @program = Program.new
    
  end

  # GET /programs/1/edit
  def edit
    @children = @program.by_location(@program.location_id)
    @instructor = Instructor.all
    # if @program.program_type=="enrichment" and @program.enrichment.nil?
    #   @program.build_enrichment
    # elsif @program.program_type=="field_trip" and @program.field_trip.nil?
    #   @program.build_field_trip
    # end
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program }
      else
        format.html { render action: 'new' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:name, :program_type, :start_date, :end_date, :location_id, :child_ids => [])
    end
end
