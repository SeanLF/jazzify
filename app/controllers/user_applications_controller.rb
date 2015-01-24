class UserApplicationsController < ApplicationController
  before_action :set_user
  before_action :set_user_application, except: [:new, :create]
  before_action :set_user_applications, except: [:destroy]
  before_action :set_volunteer_positions
  before_filter :authenticate_user!
  after_action :verify_authorized, :except => :index
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized
  respond_to :html

  def index
    respond_with(@user_applications)
  end

  def new
    @user_application = UserApplication.new
    authorize @user_application
    @user_application.user_id = @user.id
    @user_application.volunteer_position_id = VolunteerPosition.find(params[:volunteer_position_id]).id
    respond_with(@user_application)
  end

  def show
    authorize @user_application
    respond_with(@user_application)
  end

  def create
    @user_application = UserApplication.new(user_application_params)
    authorize @user_application
    @user_application.save
    respond_with(@user_application)
  end

  def edit
    authorize @user_application
  end

  def update
    authorize @user_application
    @user_application.update(user_application_params)
    respond_with(@user_application)
  end

  def destroy
    authorize @user_application
    @user_application.destroy
    respond_with(@user_application)
  end

  private
    def set_user_application
      if ! params[:id].nil?
        @user_application = UserApplication.find(params[:id])
      else
        @user_application = UserApplication.new
        @user_application.user = @user
      end
    end

    def set_user_applications
      if @user.is_admin? or @user.is_moderator?
      # Don't show incomplete applications by other users
      # @user_applications = UserApplication.where("user_application_status_id != \'#{incomplete_id}\' or user_id == \'#{@user.id}\'")
        @user_applications = UserApplication.all #.where(user_application_status: "Incomplete")
        @count = UserApplication.all.count
      else
        @user_applications = UserApplication.where({user_id: "#{@user.id}"})
      end
    end

    def set_volunteer_positions
      @volunteer_positions = VolunteerPosition.all.order(:title)
    end

    def user_application_params
      params.require(:user_application).permit(:user_id, :user_application_status_id, :volunteer_position_id)
    end

    def set_user
      @user = current_user
    end
end
