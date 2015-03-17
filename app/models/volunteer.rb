class Volunteer < ActiveRecord::Base
  belongs_to :user, class_name: User, primary_key: "id", foreign_key: "user_id"
  has_one :volunteer_position, class_name: VolunteerPosition, primary_key: "id", foreign_key: "volunteer_position_id"
end
