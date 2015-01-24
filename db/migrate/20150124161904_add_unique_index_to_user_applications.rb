class AddUniqueIndexToUserApplications < ActiveRecord::Migration
  def change
    add_index :user_applications, [:user_id, :volunteer_position_id], unique: true
  end
end
