class AddIsActiveToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :is_active, :boolean, null: false, default: true
  end
end
