class UserInformation < ActiveRecord::Base

  # Tied to a user by their ID
  has_one :user, class_name: User, foreign_key: "id", primary_key: "user_id"

  # Someone cannot have the same name (first/last) and have the same postal/address
  validates_uniqueness_of [:postal_code, :address], scope: [:first_name, :last_name]

  # User cannot make more than one user information (tied to their ID)
  validates_uniqueness_of :user_id

  validates :postal_code, format: { with: /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ ]?\d{1}[A-Z]{1}\d{1}\z/i,
  message: "has the wrong format: K1A1A1 or K1A 1A1" }, allow_blank: true

  validates :home_phone_number, :work_phone_number, :cell_phone_number, :emergency_contact_number, format: { with: /\A\d{3}[-]?\d{3}[-]?\d{4}\z/,
  message: 'has the wrong format: 6131111111, 613-111-1111' }, allow_blank: true

  validates :t_shirt_size, inclusion: { in: %w(Small Medium Large XL XXL XXXL),
    message: "%{value} is not a valid size"
  }

  validate :availability_has_4_dates_min?
  validate :unavailability_are_valid_dates?
  validate :no_overlap_in_availability?

  validate :any_phone_present?

  validates :age_group, inclusion: { in: ['Under 16', '16 - 24', '25 - 55', '55+'],
    message: "%{value} is not a valid age group" }

  validates :code_of_conduct, acceptance: {accept: true},  allow_nil: false

  # Require all but the phone # fields
  validates :user_id, :first_name, :last_name, :address, :city, :province, :postal_code, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes, presence: true

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

  private
  def any_phone_present?
    if [self.home_phone_number, self.work_phone_number, self.cell_phone_number].reject(&:blank?).size == 0
      errors.add :base, "Please enter at least one phone number."
    end
  end

  # Verify that there are at least 4 valid available dates
  def availability_has_4_dates_min?
    dates = self.availability.split(',')
    if dates.count >= 4
      dates.each do |date|
        begin
          Date.parse(date)
          rescue ArgumentError
            errors.add :base, "Don't edit hidden fields! GRR"
        end
      end
    else
      errors.add :base, "To volunteer for the Ottawa Jazz Festival, you must be available to work at least 4 shifts."
    end
  end

  # Verify that unavailable dates are invalid
  def unavailability_are_valid_dates?
    dates = self.unavailability.split(',')
    dates.each do |date|
        begin
          Date.parse(date)
          rescue ArgumentError
            errors.add :base, "Don't edit hidden fields! GRR"
        end
      end
  end

  # Verify that the user did not mark a date as available and unavailable
  def no_overlap_in_availability?
    aDates = self.availability.split(',')
    unaDates = self.unavailability.split(',')
    # if valid, there is no overlapping dates
    valid = true
    unaDates.each do |unavailableDate|
      if aDates.include?(unavailableDate)
        valid = false
      end
    end
    errors.add :base, "You can't be available and unavailable on the same dates, silly!" unless valid
  end
end
