class ApplicationController < ActionController::Base

  # Includes Authorization mechanism
  include Pundit
  before_action :set_festival_dates

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private

  def permission_denied
    head 403
  end

  def not_authorized
    redirect_to root_url, :alert => 'You are not authorized to perform the requested action!'
  end

  def set_user
    @user = current_user
    if user_signed_in?
      @user_elevated = @user.is_elevated?
      @user_admin = @user.is_admin?
    end
  end

  def set_festival_dates
    year = Time.new.year
    @festivalStartDate = "#{year}/06/18"
    @festivalEndDate = "#{year}/07/01"
  end

  if !Rails.env.production?
    ENV['two_factor_encryption_key'] = Rails.application.secrets.two_factor_encryption_key
  end

  protected
  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :otp_attempt, :id, :remember_me) }
  end

end
