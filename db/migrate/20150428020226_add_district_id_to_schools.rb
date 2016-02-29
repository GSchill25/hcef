class AddDistrictIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :school_district_id, :integer
  end
end
