json.array!(@volunteer_position_contacts) do |volunteer_position_contact|
  json.extract! volunteer_position_contact, :id, :user_id, :volunteer_position_id
  json.url volunteer_position_contact_url(volunteer_position_contact, format: :json)
end
