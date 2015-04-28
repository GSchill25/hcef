class AddPhysicalActivityToAfterSchools < ActiveRecord::Migration
  def change
    add_column :after_schools, :physical_activity, :integer
  end
end
