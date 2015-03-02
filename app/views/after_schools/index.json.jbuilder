json.array!(@after_schools) do |after_school|
  json.extract! after_school, :id, :program_id, :guardian_id, :date, :time_in, :time_out, :total_hours, :homework_time, :literacy_time, :technology_time, :reading_specialist_time, :goal
  json.url after_school_url(after_school, format: :json)
end
