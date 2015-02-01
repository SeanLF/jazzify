class CreateUserInformations < ActiveRecord::Migration
  def change
    create_table :user_informations do |t|
      t.string :user_id
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :home_phone_number
      t.string :work_phone_number
      t.string :cell_phone_number
      t.string :t_shirt_size
      t.string :age_group
      t.string :emergency_contact_name
      t.string :emergency_contact_number
      t.text :notes

      t.timestamps
    end
  end
end
