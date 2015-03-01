json.array!(@programs) do |program|
  json.extract! program, :id, :name, :program_type, :start_date, :end_date, :location_id
  json.url program_url(program, format: :json)
end
