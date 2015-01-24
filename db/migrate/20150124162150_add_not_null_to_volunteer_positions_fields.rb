class AddNotNullToVolunteerPositionsFields < ActiveRecord::Migration
  def change
  	change_column_null :volunteer_positions, :title, false
  	change_column_null :volunteer_positions, :description, false
  end
end
