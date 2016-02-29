class AddEventDateToEnrichments < ActiveRecord::Migration
  def change
    add_column :enrichments, :event_date, :date
  end
end
