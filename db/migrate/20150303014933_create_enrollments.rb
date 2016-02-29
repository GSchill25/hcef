class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :program_id
      t.integer :child_id
      t.date :date_enrolled

      t.timestamps
    end
  end
end
