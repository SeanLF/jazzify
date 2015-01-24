class UserApplication < ActiveRecord::Base
	belongs_to :user
	belongs_to :volunteer_position
	belongs_to :user_application_status
	before_create :set_default_status

	validates_uniqueness_of :volunteer_position, :scope => [:user_id]

  private
	def set_default_status
	  self.user_application_status = UserApplicationStatus.find_by({status: 'Incomplete'})
	end
end
