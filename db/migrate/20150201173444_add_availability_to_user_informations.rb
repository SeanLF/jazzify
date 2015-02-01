class AddAvailabilityToUserInformations < ActiveRecord::Migration
  def change
    add_column :user_informations, :availability, :string
  end
end
