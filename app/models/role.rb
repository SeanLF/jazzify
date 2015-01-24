class Role < ActiveRecord::Base

	has_many :users

  def is_admin?
    self.name == 'admin'
  end  

  def is_moderator?
    self.name == 'moderator'
  end

  def is_valid_user?
    self.name != 'banned'
  end

end
