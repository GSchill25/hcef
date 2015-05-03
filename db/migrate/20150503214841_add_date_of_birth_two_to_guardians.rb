class AddDateOfBirthTwoToGuardians < ActiveRecord::Migration
  def change
    add_column :guardians, :date_of_birth_two, :date
  end
end
