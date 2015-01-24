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

  def show?
  	@user_application.user == @user or @user.is_admin? or @user.is_moderator?
  end

  def create?
		true unless @user.nil?
	end

	def edit?
		update? unless @user.nil?
	end

	def update?
		@user.is_admin? or user == @user unless @user.nil?
	end

	def destroy?
		@user.is_admin? or user == @user unless @user.nil?
	end
end
