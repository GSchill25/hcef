class AddProgramIdToAfterSchool < ActiveRecord::Migration
  def change
    add_column :after_schools, :program_id, :integer
  end
end
