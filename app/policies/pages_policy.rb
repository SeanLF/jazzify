class PagesPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

	attr_reader :user

	def initialize(user)
		@user = user
	end
end
