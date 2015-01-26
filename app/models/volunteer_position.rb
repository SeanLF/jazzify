class VolunteerPosition < ActiveRecord::Base

	validates :title, :description, :contact, :contact_email, presence: true
	has_many :user_application, :dependent => :destroy

end
