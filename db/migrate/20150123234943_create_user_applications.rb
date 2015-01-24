class CreateUserApplications < ActiveRecord::Migration
  def change
    create_table :user_applications do |t|
      t.string :user_id
      t.string :user_application_status_id
      t.string :volunteer_position_id

      t.timestamps
    end
  end
end
