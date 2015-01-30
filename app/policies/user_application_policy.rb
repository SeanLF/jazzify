class UserApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_reader :user, :user_application

  def initialize(user, user_application)
		@user = user
		@user_application = user_application
  end

  def index?
    true
  end

  def new?
    true
  end

  def create?
    grant_access?
  end

  def show?
  	@user_application.user == @user or @user.is_elevated?
  end

	def edit?
		@user.is_admin? or @user.is_moderator? or @user_application.user == @user
	end

	def update?
		grant_access?
	end

	def destroy?
		@user.is_admin? or @user_application.user == @user
	end

	private
	def grant_access?
    # If the user is an admin, just let them do whatever
    if @user.is_admin?
      return true

    # If the user is a moderator, they can't change an application user or position
    elsif @user.is_moderator?
      unchanged_application = UserApplication.find(@user_application.id)
      granted = @user_application.user_id == unchanged_application.user_id
      granted = granted and @user_application.volunteer_position_id == unchanged_application.volunteer_position_id
      return granted

    # The user can't apply on behalf of another user, and cannot accept or deny their own application
    else
      user_application_statuses_for_user = UserApplicationStatus.where(status: ["Pending", "Incomplete"])
      granted = user_application_statuses_for_user.include?(@user_application.user_application_status)
      granted = granted and @user.id == @user_application.user_id
      return granted
    end
	end
end
