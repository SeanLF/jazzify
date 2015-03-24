class VolunteerPosition < ActiveRecord::Base

	validates :title, :description, :contact, :contact_email, presence: true
  has_many :first_choice_user_application, dependent: :destroy, class_name: UserApplication, foreign_key: "first_choice_volunteer_position_id"
  has_many :second_choice_user_application, dependent: :destroy, class_name: UserApplication, foreign_key: "second_choice_volunteer_position_id"
	has_many :third_choice_user_application, dependent: :destroy, class_name: UserApplication, foreign_key: "third_choice_volunteer_position_id"

  # Managed by users
  has_many :volunteer_position_contacts
  has_many :users, through: :volunteer_position_contacts

end
