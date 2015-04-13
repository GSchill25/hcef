class ChangeProgramIdToLocationId < ActiveRecord::Migration
  def change
  	rename_column :assignments, :program_id, :location_id
  end
end
