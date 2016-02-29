class ChangeProgramIdToLocationId < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.column_exists?(:assignments, :program_id)
      rename_column :assignments, :program_id, :location_id
    end
  end

  def down
    if ActiveRecord::Base.connection.column_exists?(:assignments, :location_id)
      rename_column :assignments, :location_id, :program_id
    end
  end
end
