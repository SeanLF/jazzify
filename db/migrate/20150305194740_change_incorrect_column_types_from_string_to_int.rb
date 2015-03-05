class ChangeIncorrectColumnTypesFromStringToInt < ActiveRecord::Migration
  def change
    change_column :user_applications, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :user_applications, :user_application_status_id, 'integer USING CAST(user_application_status_id AS integer)'
    change_column :user_informations, :user_id, 'integer USING CAST(user_id AS integer)'
    cha
  end
end
