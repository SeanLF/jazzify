class AddSecondChoiceVolunteerPositionIdAndThirdChoiceVolunteerPositionIdToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :second_choice_volunteer_position_id, :string
    add_column :user_applications, :third_choice_volunteer_position_id, :string
  end
end
