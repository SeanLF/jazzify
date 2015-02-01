class UserInformationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user_information, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized
  respond_to :html

  def index
    if @user.is_elevated?
      @user_informations = UserInformation.all
    else
      @user_informations = UserInformation.where(:user_id == @user.id)
    end
    authorize @user_informations
    respond_with(@user_informations)
  end

  def show
    authorize @user_information
    respond_with(@user_information)
  end

  def new
    @user_information = UserInformation.new
    authorize @user_information
    @user_information.user_id = @user.id
    respond_with(@user_information)
  end

  def edit
  end

  def create
    @user_information = UserInformation.new(user_information_params)
    authorize @user_information
    @user_information.save
    respond_with(@user_information)
  end

  def update
    authorize @user_information
    @user_information.update(user_information_params)
    respond_with(@user_information)
  end

  def destroy
    authorize @user_information
    @user_information.destroy
    respond_with(@user_information)
  end

  private
    def set_user_information
      @user_information = UserInformation.find(params[:id])
    end

    def user_information_params
      params.require(:user_information).permit(:user_id, :first_name, :last_name, :address, :city, :province, :postal_code, :home_phone_number, :work_phone_number, :cell_phone_number, :t_shirt_size, :age_group, :emergency_contact_name, :emergency_contact_number, :notes, :availability)
    end

    def not_authorized
    redirect_to user_informations_url, :alert => 'You are not authorized to perform the requested action!'
  end
end
