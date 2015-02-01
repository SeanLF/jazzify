class UserInformationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_reader :user, :user_information

  def initialize(user, user_information)
    @user = user
    @user_information = user_information
  end

  def index?
    true
  end
  def new?
    true
  end
  def create?
    true
  end
  def show?
    has_access?
  end
  def edit?
    has_access?
  end
  def update?
    has_access?
  end
  def destroy?
    has_access?
  end

  private
  def has_access?
    @user_information.user_id == @user.id or @user.is_elevated?
  end
end
