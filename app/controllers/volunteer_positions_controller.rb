class VolunteerPositionsController < ApplicationController
  before_action :set_volunteer_position, only: [:show, :edit, :update, :destroy]
  before_action :set_user_application, only: [:index, :show]
  before_filter :authenticate_user!, :except => [:index, :show]
  after_action :verify_authorized, :except => [:index, :show]
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized
  respond_to :html

  def index
    @volunteer_positions = VolunteerPosition.all.order(:title)
    respond_with(@volunteer_positions)
  end

  def show
    respond_with(@volunteer_position)
  end

  def new
    @volunteer_position = VolunteerPosition.new
    authorize @volunteer_position
    respond_with(@volunteer_position)
  end

  def edit
    authorize @volunteer_position
  end

  def create
    @volunteer_position = VolunteerPosition.new(volunteer_position_params)
    authorize @volunteer_position
    @volunteer_position.save
    respond_with(@volunteer_position)
  end

  def update
    authorize @volunteer_position
    @volunteer_position.update(volunteer_position_params)
    respond_with(@volunteer_position)
  end

  def destroy
    authorize @volunteer_position
    @volunteer_position.destroy
    respond_with(@volunteer_position)
  end

  private
    def set_volunteer_position
      @volunteer_position = VolunteerPosition.find(params[:id])
    end

    def volunteer_position_params
      params.require(:volunteer_position).permit(:title, :description, :objective, :duties, :requirements, :contact, :contact_email)
    end

    def set_user_application
      @user_application = UserApplication.new
      @user_application.user = @user
      @user_application.volunteer_position = @volunteer_position
    end
end
