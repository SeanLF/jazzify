class UserApplication < ActiveRecord::Base
	belongs_to :user, class_name: User, primary_key: "id", foreign_key: "user_id"
  belongs_to :first_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id", foreign_key: "first_choice_volunteer_position_id"
  belongs_to :second_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id", foreign_key: "second_choice_volunteer_position_id"
	belongs_to :third_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id", foreign_key: "third_choice_volunteer_position_id"
	belongs_to :user_application_status, class_name: UserApplicationStatus, primary_key: "id", foreign_key: "user_application_status_id"
  belongs_to :status_changed_by_user, class_name: User, primary_key: "id", foreign_key: "status_changed_by"
	before_create :set_default_status

	validates_uniqueness_of :user_id, message: "has already applied"
  validate :choices_distinct?
  validates :first_choice_volunteer_position_id, :second_choice_volunteer_position_id, :third_choice_volunteer_position_id, presence: true

  def self.data_for_index
    self.joins(:user, user: :user_information)
    .joins(:user_application_status).joins(:first_choice_volunteer_position).joins(:second_choice_volunteer_position).joins(:third_choice_volunteer_position)
    .order(created_at: :desc)
    .select(:id, :created_at, :status, "concat(user_informations.first_name, ' ', user_informations.last_name) AS name", 'volunteer_positions.name AS first_choice', 'second_choice_volunteer_positions_user_applications.name AS second_choice', 'third_choice_volunteer_positions_user_applications.name AS third_choice')
  end

  def self.export
    self.joins(:user, user: :user_information)
    .joins(:user_application_status)
    .joins(:first_choice_volunteer_position)
    .joins(:second_choice_volunteer_position)
    .joins(:third_choice_volunteer_position)
    .select(:first_name, :last_name, :address, :city, :province, :postal_code, :home_phone_number, :work_phone_number, :cell_phone_number, :email, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes, :availability, 'volunteer_positions.name AS first_choice', 'second_choice_volunteer_positions_user_applications.name AS second_choice', 'third_choice_volunteer_positions_user_applications.name AS third_choice')
  end

  def self.export_for_position(volunteer_position_id, choice)
    self.export.where("#{choice}_choice_volunteer_position_id = ?", volunteer_position_id)
  end

  private
	def set_default_status
      self.user_application_status = UserApplicationStatus.find_by({status: 'Pending'})
	end

  def choices_distinct?
    if self.first_choice_volunteer_position_id == self.second_choice_volunteer_position_id or self.first_choice_volunteer_position_id == self.third_choice_volunteer_position_id or self.second_choice_volunteer_position_id == self.third_choice_volunteer_position_id
        errors.add :base, "You must select three distinct choices."
    end
  end
end
