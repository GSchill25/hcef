json.array!(@school_districts) do |school_district|
  json.extract! school_district, :id, :name
  json.url school_district_url(school_district, format: :json)
end
