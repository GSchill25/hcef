class AddProviderToFieldTrips < ActiveRecord::Migration
  def change
    add_column :field_trips, :provider_id, :integer
  end
end
