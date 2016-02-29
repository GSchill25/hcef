class CreateAfterSchools < ActiveRecord::Migration
  def change
    create_table :after_schools do |t|
      t.date :date
      t.timestamp :time_in
      t.timestamp :time_out
      t.float :total_hours
      t.time :homework_time
      t.time :literacy_time
      t.time :technology_time
      t.time :reading_specialist_time
      t.text :goal

      t.timestamps
    end
  end
end
