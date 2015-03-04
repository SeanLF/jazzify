class PagesController < ApplicationController
	before_action :set_user, only: :permissions
  before_filter :authenticate_user!, only: :permissions
  after_action :verify_authorized, :only => :permissions
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized
  respond_to :html

  # This method is used to show admins and mods all of the Jazzify permissions
	def permissions
		authorize @user
		@permissions = []
		only_theirs = "Only theirs"
		yes = "Yes"
		no = "No"
		names = ["View positions", "Create positions", "Edit positions", "Delete positions",
		 "Apply", "View applications", "Edit applications", "Delete applications",
		 "Change application submission status"]
		admin_permissions = [yes, yes, yes, yes, yes, "All", yes, yes, yes]
		mod_permissions = [yes, no, yes, no, yes, "All but incomplete", only_theirs, only_theirs, yes]
		user_permissions = [yes, no, no, no, yes, only_theirs, only_theirs, only_theirs, no]
		names.each_with_index do |permission, index|
			@permissions << { name: names[index], admin: admin_permissions[index], mod: mod_permissions[index], user: user_permissions[index]}
		end

    @title = 'Permissions'
	end

  def about
    @title = 'About'
  end

  def code_of_conduct
    @title = 'Code of Conduct'
  end

  def fake_user_info
    @title = 'User Information Example'
  end

  def privacy
    @title = 'Privacy Policy'
  end

  def home
    @home = true
  end

end
