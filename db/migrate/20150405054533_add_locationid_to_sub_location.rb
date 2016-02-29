class AddLocationidToSubLocation < ActiveRecord::Migration
  def change
    add_column :sub_locations, :location_id, :integer
  end
end
