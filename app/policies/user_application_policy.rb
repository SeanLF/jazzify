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
    !@user.nil?
  end

  def show?
  	@user_application.user == @user or @user.is_elevated?
  end

  def create?
		true unless @user.nil?
	end

	def edit?
		update? unless @user.nil?
	end

	def update?
		grant_access?
	end

	def destroy?
		grant_access?
	end

	private
	def grant_access?
		@user.is_admin? or @user_application.user == @user unless @user.nil?
	end
end
