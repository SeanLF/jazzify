class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  before_create :set_default_role

  def is_admin?
    self.role == Role.find_by_name('admin')
  end  

  def is_moderator?
    self.role == Role.find_by_name('moderator')
  end

  private
  def set_default_role
    self.role = Role.find_by_name('registered')
  end
end