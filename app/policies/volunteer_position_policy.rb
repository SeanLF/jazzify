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
			true
		else
			volunteer_position.all? { |vp| vp.visible == true }
		end
	end

	def show?
		if @user and @user.is_elevated?
			true
		else
			@volunteer_position.visible
		end
	end

	def create?
		new? unless user.nil?
	end

	def edit?
		update? unless user.nil?
	end

	def new?
		@user.is_admin? unless @user.nil?
	end

	def update?
		@user.is_elevated? unless @user.nil?
	end

	def destroy?
		@user.is_admin? unless @user.nil?
	end
end
