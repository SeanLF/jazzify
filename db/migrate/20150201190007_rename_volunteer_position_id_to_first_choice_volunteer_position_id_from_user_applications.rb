class RenameVolunteerPositionIdToFirstChoiceVolunteerPositionIdFromUserApplications < ActiveRecord::Migration
  def change
    remove_column :user_applications, :volunteer_position_id, :string
    add_column :user_applications, :first_choice_volunteer_position_id, :string
  end
end
