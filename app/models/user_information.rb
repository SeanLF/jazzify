class UserInformation < ActiveRecord::Base

  # Tied to a user by their ID
  has_one :user, class_name: User, foreign_key: "user_id"

  # Someone cannot have the same name (first/last) and have the same postal/address
  validates_uniqueness_of [:postal_code, :city], :scope => [:first_name, :last_name]

  # User cannot make more than one user information (tied to their ID)
  validates_uniqueness_of :user_id

  # Require all but the phone # fields
  validates :user_id, :first_name, :last_name, :address, :city, :province, :postal_code, :home_phone_number, :work_phone_number, :cell_phone_number, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes, :availability, presence: true

end
