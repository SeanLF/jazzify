class Role < ActiveRecord::Base

	has_many :users

  def self.elevated
    Role.where("name in ('Admin', 'Moderator')")
  end

  def is_admin?
    self.name == 'Admin'
  end

  def is_moderator?
    self.name == 'Moderator'
  end

  def is_valid_user?
    self.name != 'Banned'
  end

end
