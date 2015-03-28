json.array!(@sub_locations) do |sublocation|
  json.extract! sub_location, :id, :name, :address_line_one, :address_line_two, :city, :state, :zip, :phone, :location_id
  json.url sub_location_url(sublocation, format: :json)
end
