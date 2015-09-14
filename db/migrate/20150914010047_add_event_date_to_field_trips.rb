class AddEventDateToFieldTrips < ActiveRecord::Migration
  def change
    add_column :field_trips, :event_date, :date
  end
end
