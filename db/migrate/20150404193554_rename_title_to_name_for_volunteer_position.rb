class RenameTitleToNameForVolunteerPosition < ActiveRecord::Migration
  def change
    rename_column :volunteer_positions, :title, :name
  end
end
