class ChangeChoiceVolunteerPositionIdColumnTypes < ActiveRecord::Migration
  def change
    change_column :user_applications, :first_choice_volunteer_position_id, 'integer USING CAST(first_choice_volunteer_position_id AS integer)'
    change_column :user_applications, :second_choice_volunteer_position_id, 'integer USING CAST(second_choice_volunteer_position_id AS integer)'
    change_column :user_applications, :third_choice_volunteer_position_id, 'integer USING CAST(third_choice_volunteer_position_id AS integer)'
  end
end
