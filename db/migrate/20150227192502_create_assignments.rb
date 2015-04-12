class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :instructor_id
      t.integer :location_id

      t.timestamps
    end
  end
end
