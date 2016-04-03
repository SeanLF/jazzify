class VolunteerPositionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user_if_logged_in, only: [:index, :show]
  before_action :set_volunteer_position, except: [:index, :new, :create]
  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  respond_to :html

  # Listing of all volunteering positions.
  def index
    flash[:notice] = 'Due to an overwhelming response, we are running out of positions to fill. You may still apply, but doing so will add you to our waiting list. You will only be contacted if a position opens up and you are its next candidate.'
    if @user and @user.is_elevated?
      @volunteer_positions = VolunteerPosition.all.order(:name)
    else
      @volunteer_positions = VolunteerPosition.visible.order(:name)
    end
    authorize @volunteer_positions
    respond_with(@volunteer_positions)
  end

  # Show a specific volunteer position.
  def show
    authorize @volunteer_position
    respond_with(@volunteer_position)
  end

  # Open page to create a new volunteer position.
  def new
    @volunteer_position = VolunteerPosition.new
    authorize @volunteer_position
    respond_with(@volunteer_position)
  end

  # Open page to edit a volunteer position.
  def edit
    authorize @volunteer_position
  end

  # Create the volunteer position and insert it into the database.
  def create
    @volunteer_position = VolunteerPosition.new(volunteer_position_params)
    authorize @volunteer_position
    @volunteer_position.save
    respond_with(@volunteer_position)
  end

  # Update an existing volunteer position record in the database.
  def update
    authorize @volunteer_position
    @volunteer_position.update(volunteer_position_params)
    respond_with(@volunteer_position)
  end

  # Destroy an existing volunteer position record in the database.
  def destroy
    authorize @volunteer_position
    @volunteer_position.destroy
    respond_with(@volunteer_position)
  end

  private
    def set_volunteer_position
      @volunteer_position = VolunteerPosition.find(params[:id])
    end

    # Define the paramaters permitted when submitting a request to this resource.
    def volunteer_position_params
      params.require(:volunteer_position).permit(:name, :description, :objective, :duties, :requirements, :contact, :contact_email, :visible)
    end

    # When a user is not authorized to do something in the context of
    # volunteer positions, redirect them to the index & notify them
    # why they're being redirected to the index.
    def not_authorized
      redirect_to volunteer_positions_url, alert: "You are not authorized to perform the requested action!"
    end
end
