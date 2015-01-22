class VolunteerPositionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

	attr_reader :user, :volunteer_position

	def initialize(user, volunteer_position)
		@user = user
		@volunteer_position = volunteer_position
	end

	def create?
		return new?
	end

	def edit?
		return update?
	end

	def new?
		user.is_admin?
	end

	def update?
		user.is_admin? or user.is_moderator?
	end

	def destroy?
		user.is_admin?
	end
end