class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role, class_name: Role, foreign_key: "role_id"
  belongs_to :volunteer_application
  has_many :volunteer_application, :dependent => :destroy
  before_create :set_default_role

  validates :email, presence: true, uniqueness: true

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