class AddProgramIdToFieldTrip < ActiveRecord::Migration
  def change
    add_column :field_trips, :program_id, :integer
  end
end
