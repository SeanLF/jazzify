class VolunteerPositionContact < ActiveRecord::Base
  belongs_to :user
  belongs_to :volunteer_position

  def self.index
    self.joins(:volunteer_position)
      .joins('left join users as u on u.id = volunteer_position_contacts.user_id')
      .joins('left join user_informations as ui on u.id = ui.user_id')
      .select(:id, :first_name, :last_name, :title)
  end
end
