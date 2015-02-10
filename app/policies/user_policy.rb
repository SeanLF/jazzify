class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

	attr_reader :user

	def initialize(user, record)
		@user = user
		@record = record
	end

	def permissions?
		@user.is_elevated? unless @user.nil?
	end

  def export_user_applications?
    @user.is_elevated? unless @user.nil?
  end

  def index?
    if @record == :reports
      return true unless @user.is_elevated?
    end
  end
end
