class UserApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_user_application, except: [:new, :create]
  before_action :set_user_applications, only: :index
  before_action :set_volunteer_positions
  before_action :set_user_application_statuses, except: [:destroy]
  before_action :application_locked?, except: [:index, :show]
  after_action :verify_authorized, except: :index
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  respond_to :html

  # Show all user applications
  def index
    # If the user is registered, redirect to their application
    if !@user.is_elevated?
      registered_user_application = UserApplication.find_by(user_id: @user.id)
      if registered_user_application.nil?
        redirect_to new_user_application_path
      else
        redirect_to user_application_url registered_user_application.id
      end
    else
      authorize @user_applications
      @vpc = VolunteerPositionContact.find_by(user_id: @user.id)
      if @vpc and @vpc.volunteer_position_id
        @vp = @vpc.volunteer_position_id
      end
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
      Thread.new do
        notify_admins_link('New Jazzify Application', @user.user_information.full_name + " has applied", view_user_applications_path(@user_application))
      end
      redirect_to success_user_applications_path
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

  # Accept or deny application
  def accept_or_deny
    @user_application = UserApplication.find(params['user_application_id'])
    authorize @user_application
    status = params['accept_or_deny']
    @user_application.coordinator_notes = params['coordinator_notes']
    change_status(status, "Application #{status.downcase} successfully")
  end

  # Reset application status to pending
  def reset
    @user_application = UserApplication.find(params['id'])
    authorize @user_application
    @user_application.coordinator_notes = nil
    change_status("Pending", "Application status reset successfully")
  end

  # Success page after applying
  def success
    @user_application = UserApplication.find_by(user_id: @user.id)
    authorize @user_application
    @time = (@user_application.created_at + 1.days).to_formatted_s(:long)
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
    @user_applications = UserApplication.data_for_index(params[:page])
    @count = @user_applications.length
  end

  def set_volunteer_positions
    if @user and @user.is_elevated?
      @volunteer_positions = VolunteerPosition.all.order(:name)
    else
      @volunteer_positions = VolunteerPosition.visible.order(:name)
    end
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
end

