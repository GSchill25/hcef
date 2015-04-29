class AddHandsOnActivityToAfterSchools < ActiveRecord::Migration
  def change
    add_column :after_schools, :hands_on_activity, :integer
  end
end
