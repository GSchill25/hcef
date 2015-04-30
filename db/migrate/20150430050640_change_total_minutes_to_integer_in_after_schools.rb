class ChangeTotalMinutesToIntegerInAfterSchools < ActiveRecord::Migration
  def up
    change_column :after_schools, :total_minutes, :integer
  end
  def down
    change_column :after_schools, :total_minutes, :float
  end
end
