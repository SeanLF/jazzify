class RenameVolunteerPositionIdToFirstChoiceVolunteerPositionIdFromUserApplications < ActiveRecord::Migration
  def change
    rename_column :user_applications, :volunteer_position_id, :first_choice_volunteer_position_id
  end
end
