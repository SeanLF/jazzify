json.array!(@volunteer_positions) do |volunteer_position|
  json.extract! volunteer_position, :id, :title, :objective, :duties, :requirements, :contact
  json.url volunteer_position_url(volunteer_position, format: :json)
end
