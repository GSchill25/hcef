class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :phone
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
