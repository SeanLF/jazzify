class AddStatusChangedByToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :status_changed_by, :int
  end
end
