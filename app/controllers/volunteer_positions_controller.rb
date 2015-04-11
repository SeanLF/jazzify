class VolunteerPositionsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_user_if_logged_in, :only => [:index, :show]
  before_action :set_volunteer_position, except: [:index]
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized
  respond_to :html

  def index
    if @user and @user.is_elevated?
      @volunteer_positions = VolunteerPosition.all.order(:name)
    else
      @volunteer_positions = VolunteerPosition.visible.order(:name)
    end
    authorize @volunteer_positions
    respond_with(@volunteer_positions)
  end

  def show
    authorize @volunteer_position
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
      params.require(:volunteer_position).permit(:name, :description, :objective, :duties, :requirements, :contact, :contact_email, :visible)
    end

    def not_authorized
      redirect_to volunteer_positions_url, :alert => "You are not authorized to perform the requested action!"
    end
end
