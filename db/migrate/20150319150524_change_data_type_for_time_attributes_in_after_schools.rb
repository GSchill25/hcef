class ChangeDataTypeForTimeAttributesInAfterSchools < ActiveRecord::Migration
  def up
    change_column :after_schools, :homework_time, 'integer USING CAST(homework_time AS integer)'
    change_column :after_schools, :literacy_time, 'integer USING CAST(literacy_time AS integer)'
    change_column :after_schools, :technology_time, 'integer USING CAST(technology_time AS integer)'
    change_column :after_schools, :reading_specialist_time, 'integer USING CAST(reading_specialist_time AS integer)'
  end
  def down
    change_column :after_schools, :homework_time, :time
    change_column :after_schools, :literacy_time, :time
    change_column :after_schools, :technology_time, :time
    change_column :after_schools, :reading_specialist_time, :time
  end
end
