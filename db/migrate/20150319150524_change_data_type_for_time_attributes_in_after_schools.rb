class ChangeDataTypeForTimeAttributesInAfterSchools < ActiveRecord::Migration
  def up
    change_column :after_schools, :homework_time, :integer
    change_column :after_schools, :literacy_time, :integer
    change_column :after_schools, :technology_time, :integer
    change_column :after_schools, :reading_specialist_time, :integer
  end
  def down
    change_column :after_schools, :homework_time, :time
    change_column :after_schools, :literacy_time, :time
    change_column :after_schools, :technology_time, :time
    change_column :after_schools, :reading_specialist_time, :time
  end
end
