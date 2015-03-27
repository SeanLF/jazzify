class VolunteerPositionContactPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end

  attr_reader :user, :volunteer_position_contact

  def initialize(user, volunteer_position_contact)
    @user = user
    @volunteer_position_contact = volunteer_position_contact
  end

  def create?
    is_admin?
  end

  def edit?
    is_admin?
  end

  def new?
    is_admin?
    end
  end

  def update?
    is_admin?
  end

  def destroy?
    is_admin?
  end

  private
  def is_admin?
    user.is_admin? unless user.nil?
  end
end
