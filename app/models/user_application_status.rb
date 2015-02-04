class UserApplicationStatus < ActiveRecord::Base
	has_many :user_application

  def is_accepted?
    self.status == "Accepted"
  end

  def is_denied?
    self.status == "Denied"
  end

  def is_pending?
    self.status == "Pending"
  end

end
