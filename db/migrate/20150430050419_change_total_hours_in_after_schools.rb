class ChangeTotalHoursInAfterSchools < ActiveRecord::Migration
  def change
    rename_column :after_schools, :total_hours, :total_minutes
  end
end
