class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :user_id
      t.integer :volunteer_position_id

      t.timestamps null: false
    end
  end
end
