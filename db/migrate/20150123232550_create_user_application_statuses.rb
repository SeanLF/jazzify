class CreateUserApplicationStatuses < ActiveRecord::Migration
  def change
    create_table :user_application_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
