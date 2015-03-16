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

  # Show all user applications
  def index
    # If the user is registered, redirect to their application
    if !@user.is_elevated?
      registered_user_application = UserApplication.find_by(user_id: @user.id)
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
    @user_information = UserInformation.find_by(user_id: @user.id)
    new_user_application
    authorize @user_application
    if @user_information.nil?
      # Verify that the user has a user information
      session[:return_to] = new_user_application_url
      redirect_to new_user_information_url and return
    elsif UserApplication.find_by(user_id: @user.id).nil?
      # Verify that the user hasn't already applied
      respond_with @user_application
    else
      @user_application = UserApplication.find_by(user_id: @user.id)
      respond_with(@user_application)
    end
    return
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
    if @user_application.save and @user_application.user_id == @user.id
      redirect_to success_user_applications_path
      return
    else
      respond_with(@user_application)
    end
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

    if @user_application.update(user_application_params) and @user_application.user_id == @user.id
      redirect_to success_user_applications_path
      return
    else
      respond_with(@user_application)
    end
  end

  # Delete application
  def destroy
    authorize @user_application
    @user_application.destroy
    respond_with(@user_application)
  end

  # View application
  def view
    @user_application = UserApplication.find(params[:id])
    authorize @user_application
    @user_information = @user_application.user.user_information
  end

  # Accept application
  def accept
    @user_application = UserApplication.find(params['id'])
    authorize @user_application
    volunteer = Volunteer.create(user_id: @user_application.user_id, volunteer_position_id: 0)
    return change_status("Accepted", "Application accepted successfully")
  end

  # Deny application
  def deny
    @user_application = UserApplication.find(params['id'])
    authorize @user_application
    delete_volunteer_if_exists
    return change_status("Denied", "Application denied successfully")
  end

  # Reset application status to pending
  def reset
    @user_application = UserApplication.find(params['id'])
    authorize @user_application
    delete_volunteer_if_exists
    return change_status("Pending", "Application status reset successfully")
  end

  # Success page after applying
  def success
    @user_application = UserApplication.find_by(user_id: @user.id)
    authorize @user_application
  end

  # Private methods
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
      UserApplication.joins(set_user_applications_joins_users)
    .joins(set_user_applications_joins_user_informations)
    .joins(set_user_applications_joins_user_information_statuses)
    .select(set_user_applications_select_clause)
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

  def change_status(status, message)
    @user_application.user_application_status_id = UserApplicationStatus.find_by(status: status).id
    @user_application.status_changed_by = @user.id

    if @user_application.save
      redirect_to user_applications_path, :alert => message
    end
  end

  def set_user_applications_joins_users
    return "inner join users on users.id = user_applications.user_id"
  end

  def set_user_applications_joins_user_informations
    return "inner join user_informations on users.id = user_informations.user_id"
  end

  def set_user_applications_joins_user_information_statuses
    return "inner join user_application_statuses on user_applications.user_application_status_id = user_application_statuses.id"
  end

  def set_user_applications_select_clause
    return "user_applications.id, user_informations.first_name,
            user_informations.last_name, user_applications.updated_at,
            user_application_statuses.status,
            (select title as c1 from Volunteer_Positions as v where v.id = first_choice_volunteer_position_id),
            (select title as c2 from Volunteer_Positions as v where v.id = second_choice_volunteer_position_id),
            (select title as c3 from Volunteer_Positions as v where v.id = third_choice_volunteer_position_id)"
  end

  def delete_volunteer_if_exists
    volunteer = Volunteer.find_by(user_id: @user_application.user_id)
    if volunteer
      volunteer.destroy
    end
  end
end

