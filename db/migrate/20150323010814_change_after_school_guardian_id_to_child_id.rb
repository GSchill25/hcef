class ChangeAfterSchoolGuardianIdToChildId < ActiveRecord::Migration
  def change
    change_table :after_schools do |t|
      t.rename :guardian_id, :child_id
    end
  end
end
