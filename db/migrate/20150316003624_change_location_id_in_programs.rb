class ChangeLocationIdInPrograms < ActiveRecord::Migration
  def change
    # change_column :programs, :location_id, 'integer USING CAST(location_id AS integer)'
    change_column :programs, :location_id, :integer
  end
end
