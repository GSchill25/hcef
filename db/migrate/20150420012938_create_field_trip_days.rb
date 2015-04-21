class CreateFieldTripDays < ActiveRecord::Migration
  def change
    create_table :field_trip_days do |t|
      t.integer :child_id
      t.integer :field_trip_id

      t.timestamps
    end
  end
end
