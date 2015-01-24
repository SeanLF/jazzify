class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  belongs_to :volunteer_application
  has_many :volunteer_application
  before_create :set_default_role

  validates :email, presence: true, uniqueness: true

  def is_admin?
    self.role == Role.find_by_name('admin')
  end  

  def is_moderator?
    self.role == Role.find_by_name('moderator')
  end

  def is_valid_user?
    self.role != Role.find_by_name('registered')
  end

  private
  def set_default_role
    self.role = Role.find_by_name('registered')
  end
end