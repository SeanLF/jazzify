json.array!(@user_informations) do |user_information|
  json.extract! user_information, :id, :user_id, :first_name, :last_name, :address, :city, :province, :postal_code, :home_phone_number, :work_phone_number, :cell_phone_number, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes
  json.url user_information_url(user_information, format: :json)
end
