class AddCodeOfConductToUserInformations < ActiveRecord::Migration
  def change
    add_column :user_informations, :code_of_conduct, :string, default: :false
  end
end
