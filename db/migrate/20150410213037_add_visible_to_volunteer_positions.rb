class AddVisibleToVolunteerPositions < ActiveRecord::Migration
  def change
    add_column :volunteer_positions, :visible, :boolean, default: true
  end
end
