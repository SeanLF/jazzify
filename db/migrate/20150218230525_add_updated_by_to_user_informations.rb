class AddUpdatedByToUserInformations < ActiveRecord::Migration
  def change
    add_column :user_informations, :updated_by, :integer
  end
end
