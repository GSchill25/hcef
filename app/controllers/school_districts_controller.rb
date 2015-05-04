class SchoolDistrictsController < ApplicationController
  before_action :set_school_district, only: [:show, :edit, :update, :destroy]

  # GET /school_districts
  # GET /school_districts.json
  def index
    @school_districts = SchoolDistrict.all
  end

  # GET /school_districts/1
  # GET /school_districts/1.json
  def show
  end

  # GET /school_districts/new
  def new
    @school_district = SchoolDistrict.new
  end

  # GET /school_districts/1/edit
  def edit
  end

  # POST /school_districts
  # POST /school_districts.json
  def create
    @school_district = SchoolDistrict.new(school_district_params)
      if @school_district.save
        redirect_to new_child_path, notice: "The school #{@school_district.name} was added to the system"
      else
        redirect_to new_child_path, alert: "The school #{@school_district.name} was not added to the system"
      end
  end

  # PATCH/PUT /school_districts/1
  # PATCH/PUT /school_districts/1.json
  def update
    respond_to do |format|
      if @school_district.update(school_district_params)
        format.html { redirect_to @school_district, notice: 'School district was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_districts/1
  # DELETE /school_districts/1.json
  def destroy
    @school_district.destroy
    respond_to do |format|
      format.html { redirect_to school_districts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_district
      @school_district = SchoolDistrict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_district_params
      params.require(:school_district).permit(:name)
    end
end
