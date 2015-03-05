class UserApplicationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user
  before_action :set_user_application, except: [:new, :create]
  before_action :set_user_applications, only: :index
  before_action :set_volunteer_positions
  before_action :set_user_application_statuses, except: [:destroy]
  after_action :verify_authorized, except: :index
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized
  respond_to :html

  # Show all
  def index
    # If the user is registered, redirect to their application
    if !@user.is_elevated?
      registered_user_application = UserApplication.find_by(user_id: "#{@user.id}")
      if registered_user_application.nil?
        redirect_to volunteer_positions_url
      else
        redirect_to user_application_url registered_user_application.id
      end
      return
    else
      authorize @user_applications
      respond_with(@user_applications)
    end
  end

  # Apply to position page
  def new
    new_user_application
    authorize @user_application
    @user_information = UserInformation.find_by(user_id: "#{@user.id}")
    if @user_information.nil?
      session[:return_to] = new_user_application_url
      session[:origin] = URI(request.referer).path unless request.referer.nil?
      redirect_to new_user_information_url and return
    end
    @user_application_statuses = UserApplicationStatus.find_by status: 'Pending'
    respond_with(@user_application)
  end

  # Show an application
  def show
    authorize @user_application
    get_application_volunteer_choices
    respond_with(@user_application)
  end

  # Confirmation of the application
  def create
    @user_application = UserApplication.new(user_application_params)
    authorize @user_application
    @user_application.save
    respond_with(@user_application)
  end

  # Edit an application
  def edit
    authorize @user_application
  end

  # Submit edited changes
  def update
    @user_application = UserApplication.find(params[:id])
    @user_application.attributes = user_application_params
    authorize @user_application
    @user_application.update(user_application_params)
    respond_with(@user_application)
  end

  # Delete application
  def destroy
    authorize @user_application
    @user_application.destroy
    respond_with(@user_application)
  end

  def view
    @user_application = UserApplication.find(params[:id])
    authorize @user_application
    @user_information = @user.user_information
  end

  def accept
    @user_application = UserApplication.find(params[:id])
    authorize @user_application
    @user_application.user_application_status_id = UserApplicationStatus.find_by(status: 'Accepted').id
    if @user_application.save
      redirect_to user_applications_path, :alert => 'Application accepted successfully'
    end
  end

  def deny
    @user_application = UserApplication.find(params['id'])
    authorize @user_application
    @user_application.user_application_status_id = UserApplicationStatus.find_by(status: 'Denied').id
    if @user_application.save
      redirect_to user_applications_path, :alert => 'Application denied successfully'
    end
  end

  def reset
    @user_application = UserApplication.find(params['id'])
    authorize @user_application
    @user_application.user_application_status_id = UserApplicationStatus.find_by(status: 'Pending').id
    if @user_application.save
      redirect_to user_applications_path, :alert => 'Application status reset successfully'
    end
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
    @user_applications =
      UserApplication.joins("inner join users on cast(users.id as text) = user_applications.user_id")
        .joins("inner join user_informations on cast(users.id as text) = user_informations.user_id")
        .joins("inner join user_application_statuses on user_applications.user_application_status_id = cast(user_application_statuses.id as text)")
        .select("user_applications.id, user_informations.first_name,
          user_informations.last_name, user_applications.updated_at,
          user_application_statuses.status,
          (select title as c1 from Volunteer_Positions as v where cast(v.id as text) = first_choice_volunteer_position_id),
          (select title as c2 from Volunteer_Positions as v where cast(v.id as text) = second_choice_volunteer_position_id),
          (select title as c3 from Volunteer_Positions as v where cast(v.id as text) = third_choice_volunteer_position_id)")
        .paginate(:page => params[:page], per_page: 100)
    @count = @user_applications.length
  end

  def set_volunteer_positions
    @volunteer_positions = VolunteerPosition.all.order(:title)
  end

  def user_application_params
    params.require(:user_application).permit(:user_id, :user_application_status_id, :first_choice_volunteer_position_id, :second_choice_volunteer_position_id, :third_choice_volunteer_position_id)
  end

  def set_user_application_statuses
    if @user.is_elevated?
      return @user_application_statuses = UserApplicationStatus.all.order(:status)
    else
      return @user_application_statuses = UserApplicationStatus.find_by(status: 'Pending')
    end
  end

  def new_user_application
    @user_application = UserApplication.new
    @user_application.user_id = @user.id
    @user_application.user_application_status_id = UserApplicationStatus.find_by(status: 'Pending').id
  end

  def not_authorized
    redirect_to user_applications_url, :alert => 'You are not authorized to perform the requested action!'
  end

  def get_application_volunteer_choices
    @first_choice_volunteer_position = VolunteerPosition.find(@user_application.first_choice_volunteer_position_id) unless @user_application.first_choice_volunteer_position_id.nil?
    @second_choice_volunteer_position = VolunteerPosition.find(@user_application.second_choice_volunteer_position_id) unless @user_application.second_choice_volunteer_position_id.nil?
    @third_choice_volunteer_position = VolunteerPosition.find(@user_application.third_choice_volunteer_position_id) unless @user_application.third_choice_volunteer_position_id.nil?
  end
end
