class UserInformation < ActiveRecord::Base

  # Tied to a user by their ID
  has_one :user, class_name: User, foreign_key: "user_id"

  # Someone cannot have the same name (first/last) and have the same postal/address
  validates_uniqueness_of [:postal_code, :address], :scope => [:first_name, :last_name]

  # User cannot make more than one user information (tied to their ID)
  validates_uniqueness_of :user_id

  validates :postal_code, format: { with: /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ ]?\d{1}[A-Z]{1}\d{1}\z/i,
    message: "has the wrong format: K1W1E2 or K1W 1E2" }

  validates :home_phone_number, :work_phone_number, :cell_phone_number, :emergency_contact_number, format: { with: /\A\d{3}[-]?\d{3}[-]?\d{4}\z/,
    message: 'has the wrong format: 6131111111, 613-111-1111' }

  validates :t_shirt_size, inclusion: { in: %w(Small Medium Large XL XXL XXXL),
    message: "%{value} is not a valid size" }

  #validates :age_group, inclusion: { in: %w('Under 16' '16 - 24' '25 - 55' '55+'),
  #  message: "%{value} is not a valid age group" }

  # Require all but the phone # fields
  validates :user_id, :first_name, :last_name, :address, :city, :province, :postal_code, :home_phone_number, :work_phone_number, :cell_phone_number, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes, :availability, presence: true

  def postal_code=(val)
    self[:postal_code] = val.upcase
  end

  def first_name=(val)
    self[:first_name] = val.titleize
  end
  def last_name=(val)
    self[:last_name] = val.titleize
  end
  def address=(val)
    self[:address] = val.titleize
  end
  def city=(val)
    self[:city] = val.titleize
  end
  def emergency_contact_name=(val)
    self[:emergency_contact_name] = val.titleize
  end

end
