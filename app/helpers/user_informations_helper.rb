module UserInformationsHelper
  def format_availability_dates(availability_dates)
    availability = []
    availability_dates.split(',').sort.each do |date|
      availability << DateTime.parse(date).strftime("%B %d")
    end
    return availability
  end
end
