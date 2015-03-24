class User < ActiveRecord::Base
  devise :two_factor_authenticatable,
         :two_factor_backupable,
         :otp_secret_encryption_key => ENV['two_factor_encryption_key']

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # A user has a role
  belongs_to :role, class_name: Role, foreign_key: "role_id"

  # When a user is deleted, delete all dependencies
  has_one :user_application, dependent: :destroy
  has_one :user_information, dependent: :destroy

  # A user can manage a volunteer position
  has_many :volunteer_position_contacts
  has_many :volunteer_positions, through: :volunteer_position_contacts

  # Upon signing up, a user is assigned the default role
  before_create :set_default_role

  def is_admin?
    self.role_id == Role.find_by_name('Admin').id
  end

  def is_moderator?
    self.role_id == Role.find_by_name('Moderator').id
  end

  def is_valid_user?
    self.role_id != Role.find_by_name('Registered').id
  end

  def is_elevated?
    self.is_admin? or self.is_moderator?
  end

  private
  def set_default_role
    self.role_id = Role.find_by_name('Registered').id
  end
end
