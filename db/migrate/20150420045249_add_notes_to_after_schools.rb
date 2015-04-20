class AddNotesToAfterSchools < ActiveRecord::Migration
  def change
    add_column :after_schools, :notes, :text
  end
end
