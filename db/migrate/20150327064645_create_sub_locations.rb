class CreateSubLocations < ActiveRecord::Migration
  def change
    create_table :sub_locations do |t|
      t.string :name
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.integer :location_id

      t.timestamps
    end
  end
end
