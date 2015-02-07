class AddUnavailabilityToUserInformations < ActiveRecord::Migration
  def change
    add_column :user_informations, :unavailability, :string
  end
end
