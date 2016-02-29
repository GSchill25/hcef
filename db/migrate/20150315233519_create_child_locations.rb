class CreateChildLocations < ActiveRecord::Migration
  def change
    create_table :child_locations do |t|
      t.integer :child_id
      t.integer :location_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
