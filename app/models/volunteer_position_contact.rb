class VolunteerPositionContact < ActiveRecord::Base
  belongs_to :user
  belongs_to :volunteer_position
end
