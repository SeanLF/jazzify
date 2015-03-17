class UserApplication < ActiveRecord::Base
	belongs_to :user, class_name: User, primary_key: "id", foreign_key: "user_id"
  belongs_to :first_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id", foreign_key: "first_choice_volunteer_position_id"
  belongs_to :second_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id", foreign_key: "second_choice_volunteer_position_id"
	belongs_to :third_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id", foreign_key: "third_choice_volunteer_position_id"
	belongs_to :user_application_status, class_name: UserApplicationStatus, primary_key: "id", foreign_key: "user_application_status_id"
  has_one :status_changed_by_user, class_name: User, primary_key: "id", foreign_key: "status_changed_by"
	before_create :set_default_status

	validates_uniqueness_of :user_id, message: "has already applied"
  validate :choices_distinct?
  validates :first_choice_volunteer_position_id, :second_choice_volunteer_position_id, :third_choice_volunteer_position_id, presence: true

  def self.data_for_index(page)
    self.joins(:user)
    .joins(:user_application_status)
    .joins('inner join user_informations on users.id = user_informations.user_id')
    .joins('inner join volunteer_positions as c1 on c1.id = first_choice_volunteer_position_id')
    .joins('inner join volunteer_positions as c2 on c2.id = second_choice_volunteer_position_id')
    .joins('inner join volunteer_positions as c3 on c3.id = third_choice_volunteer_position_id')
    .select(set_user_applications_select_clause)
    .paginate(page: page, per_page: 100)
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

  def self.set_user_applications_select_clause
    return "user_applications.id,
            concat(user_informations.first_name, ' ', user_informations.last_name) AS name,
            user_applications.updated_at,
            user_application_statuses.status,
            c1.title AS first_choice,
            c2.title AS second_choice,
            c3.title AS third_choice"
  end
end
