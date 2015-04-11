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

	def index?
		if @user and @user.is_elevated?
			return true
		else
			return !volunteer_position.any? { |vp| vp.visible == false }
		end
	end

	def show?
		if @user and @user.is_elevated?
			return true
		else
			return @volunteer_position.visible
		end
	end

	def create?
		return new? unless user.nil?
	end

	def edit?
		return update? unless user.nil?
	end

	def new?
		user.is_admin?
	end

	def update?
		user.is_elevated? unless user.nil?
	end

	def destroy?
		return user.is_admin? unless user.nil?
	end
end
