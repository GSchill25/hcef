class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :grade
      t.integer :school_id
      t.integer :guardian_id
      t.boolean :active

      t.timestamps
    end
  end
end
