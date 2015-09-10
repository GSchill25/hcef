class RemoveLimitFromIntegersOnPrograms < ActiveRecord::Migration
  def up
    change_column :programs, :location_id, :integer, limit: nil
  end

  def down
    # Do nothing, remove this is good
  end
end
