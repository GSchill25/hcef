class AddProviderIdToEnrichment < ActiveRecord::Migration
  def change
    add_column :enrichments, :provider_id, :integer
  end
end
