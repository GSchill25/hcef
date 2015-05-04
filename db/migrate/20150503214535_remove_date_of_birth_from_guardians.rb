class RemoveDateOfBirthFromGuardians < ActiveRecord::Migration
  def change
    remove_column :guardians, :date_of_birth, :date
  end
end
