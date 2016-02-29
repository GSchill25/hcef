json.array!(@locations) do |location|
  json.extract! location, :id, :name, :address_line_one, :address_line_two, :city, :state, :zip, :phone
  json.url location_url(location, format: :json)
end
