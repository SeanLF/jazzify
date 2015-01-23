class VolunteerPositionsController < ApplicationController
  before_action :set_volunteer_position, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  after_action :verify_authorized, :except => [:index, :show]
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized
  respond_to :html

  def index
    @volunteer_positions = VolunteerPosition.all
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
    @volunteer_position.destroy
    respond_with(@volunteer_position)
  end

  private
    def set_volunteer_position
      @volunteer_position = VolunteerPosition.find(params[:id])
    end

    def volunteer_position_params
      params.require(:volunteer_position).permit(:title, :objective, :duties, :requirements, :contact)
    end

    def not_authorized
      redirect_to volunteer_positions_url, :alert => "You are not authorized to perform the requested action!"
    end
end
