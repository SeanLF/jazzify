class CreateVolunteerPositions < ActiveRecord::Migration
  def change
    create_table :volunteer_positions do |t|
      t.text :title
      t.text :objective
      t.text :duties
      t.text :requirements
      t.text :contact

      t.timestamps
    end
  end
end
