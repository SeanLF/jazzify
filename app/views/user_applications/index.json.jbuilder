json.array!(@user_applications) do |user_application|
  json.extract! user_application, :id, :user_id, :user_application_status_id, :volunteer_position_id
  json.url user_application_url(user_application, format: :json)
end
