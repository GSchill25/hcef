class CreateFieldTrips < ActiveRecord::Migration
  def change
    create_table :field_trips do |t|
      t.float :length
      t.text :notes

      t.timestamps
    end
  end
end
