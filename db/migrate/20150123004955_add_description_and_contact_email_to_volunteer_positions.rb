class AddDescriptionAndContactEmailToVolunteerPositions < ActiveRecord::Migration
  def change
    add_column :volunteer_positions, :contact_email, :string
    add_column :volunteer_positions, :description, :text
  end
end
