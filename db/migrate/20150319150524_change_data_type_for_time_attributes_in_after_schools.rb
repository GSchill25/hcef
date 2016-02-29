class ChangeDataTypeForTimeAttributesInAfterSchools < ActiveRecord::Migration
  def change
    change_column :after_schools, :homework_time, :integer #'integer USING CAST(extract(epoch from homework_time) AS integer)'
    change_column :after_schools, :literacy_time, :integer #'integer USING CAST(extract(epoch from literacy_time) AS integer)'
    change_column :after_schools, :technology_time, :integer #'integer USING CAST(extract(epoch from technology_time) AS integer)'
    change_column :after_schools, :reading_specialist_time, :integer #'integer USING CAST(extract(epoch from reading_specialist_time) AS integer)'
  end
end
