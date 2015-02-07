class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # A user has a role
  belongs_to :role, class_name: Role, foreign_key: "role_id"

  # A user can be the contact for a volunteer position
  belongs_to :volunteer_position

  # When a user is deleted, delete all dependencies
  has_many :user_application, dependent: :destroy
  has_one :user_information, dependent: :destroy

  # Upon signing up, a user is assigned the default role
  before_create :set_default_role

  def is_admin?
    self.role == Role.find_by_name('Admin')
  end

  def is_moderator?
    self.role == Role.find_by_name('Moderator')
  end

  def is_valid_user?
    self.role != Role.find_by_name('Registered')
  end

  def is_elevated?
    self.is_admin? or self.is_moderator?
  end

  private
  def set_default_role
    self.role = Role.find_by_name('Registered')
  end
end
