class CreateGuardianLocations < ActiveRecord::Migration
  def change
    create_table :guardian_locations do |t|
      t.integer :guardian_id
      t.integer :location_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
