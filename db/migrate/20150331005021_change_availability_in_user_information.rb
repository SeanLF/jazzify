class ChangeAvailabilityInUserInformation < ActiveRecord::Migration
  def change
    UserInformation.all.each do |user_information|
      user_information.availability = "I am available: #{format_availability_dates(user_information.availability).join(', ')}. I am unavailable: #{format_availability_dates(user_information.unavailability).join(', ')}"
      user_information.save!
    end
    remove_column :user_informations, :unavailability
  end

  def format_availability_dates(availability_dates)
    availability = []
    availability_dates.split(',').sort.each do |date|
      availability << DateTime.parse(date).strftime("%B %d")
    end
    return availability
  end
end
