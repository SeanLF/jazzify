class AddYearStartedToUser < ActiveRecord::Migration
  def change
    add_column :users, :year_started, :integer
  end
end
