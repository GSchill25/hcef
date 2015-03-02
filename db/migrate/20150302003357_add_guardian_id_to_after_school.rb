class AddGuardianIdToAfterSchool < ActiveRecord::Migration
  def change
    add_column :after_schools, :guardian_id, :integer
  end
end
