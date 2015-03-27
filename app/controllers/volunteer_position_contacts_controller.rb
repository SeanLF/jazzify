class VolunteerPositionContactsController < ApplicationController
  before_action :set_volunteer_position_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_elevated_list, only: [:new, :edit]
  before_action :authenticate_user!
  before_action :restrict_to_admin
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  # GET /volunteer_position_contacts
  # GET /volunteer_position_contacts.json
  def index
    @volunteer_position_contacts = VolunteerPositionContact.index
  end

  # GET /volunteer_position_contacts/1
  # GET /volunteer_position_contacts/1.json
  def show
  end

  # GET /volunteer_position_contacts/new
  def new
    @volunteer_position_contact = VolunteerPositionContact.new
  end

  # GET /volunteer_position_contacts/1/edit
  def edit
  end

  # POST /volunteer_position_contacts
  # POST /volunteer_position_contacts.json
  def create
    @volunteer_position_contact = VolunteerPositionContact.new(volunteer_position_contact_params)

    respond_to do |format|
      if @volunteer_position_contact.save
        format.html { redirect_to @volunteer_position_contact, notice: 'Volunteer position contact was successfully created.' }
        format.json { render :show, status: :created, location: @volunteer_position_contact }
      else
        format.html { render :new }
        format.json { render json: @volunteer_position_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteer_position_contacts/1
  # PATCH/PUT /volunteer_position_contacts/1.json
  def update
    respond_to do |format|
      if @volunteer_position_contact.update(volunteer_position_contact_params)
        format.html { redirect_to @volunteer_position_contact, notice: 'Volunteer position contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @volunteer_position_contact }
      else
        format.html { render :edit }
        format.json { render json: @volunteer_position_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteer_position_contacts/1
  # DELETE /volunteer_position_contacts/1.json
  def destroy
    @volunteer_position_contact.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_position_contacts_url, notice: 'Volunteer position contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_position_contact
      @volunteer_position_contact = VolunteerPositionContact.find(params[:id])
    end

    def set_elevated_list
      @elevated_users = User.elevated
      @volunteer_positions = VolunteerPosition.all.order(:title)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_position_contact_params
      params.require(:volunteer_position_contact).permit(:user_id, :volunteer_position_id)
    end
end
