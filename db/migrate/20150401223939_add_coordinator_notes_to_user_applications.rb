class AddCoordinatorNotesToUserApplications < ActiveRecord::Migration
  def change
    add_column :user_applications, :coordinator_notes, :text
  end
end
