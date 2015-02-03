class UserApplication < ActiveRecord::Base
	belongs_to :user, class_name: User, foreign_key: "user_id"
  belongs_to :first_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id"
  belongs_to :second_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id"
	belongs_to :third_choice_volunteer_position, class_name: VolunteerPosition, primary_key: "id"
	belongs_to :user_application_status, class_name: UserApplicationStatus, foreign_key: "user_application_status_id"
	before_create :set_default_status

	validates_uniqueness_of :user_id, message: "has already applied"
  validate :choices_distinct?
  validates :first_choice_volunteer_position_id, :second_choice_volunteer_position_id, :third_choice_volunteer_position_id, presence: true

  private
	def set_default_status
    if !UserApplicationStatus.where({status: ['Incomplete', "Pending"]}).include?(self.user_application_status)
      self.user_application_status = UserApplicationStatus.find_by({status: 'Pending'})
    end
	end

  def choices_distinct?
    if self.first_choice_volunteer_position_id == self.second_choice_volunteer_position_id or self.first_choice_volunteer_position_id == self.third_choice_volunteer_position_id or self.second_choice_volunteer_position_id == self.third_choice_volunteer_position_id
        errors.add :base, "You must select three distinct choices."
    end
  end
end
