class ChangeDefaultActiveValueOfChildAndUsers < ActiveRecord::Migration
  def change
  	change_column :children, :active, :boolean, :default => true
  	change_column :users, :active, :boolean, :default => true
  end
end
