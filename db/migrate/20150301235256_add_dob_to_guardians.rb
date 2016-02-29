class AddDobToGuardians < ActiveRecord::Migration
  def change
    add_column :guardians, :date_of_birth, :date
  end
end
