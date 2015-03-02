class CreatePrograms < ActiveRecord::Migration
  drop_table :programs
  def change
    create_table :programs do |t|
      t.string :name
      t.string :program_type
      t.string :start_date
      t.string :end_date
      t.string :location_id

      t.timestamps
    end
  end
end
