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

  def set_user_if_logged_in
    if current_user
      set_user
    end
  end

  private

  def permission_denied
    head 403
  end

  def not_authorized
    redirect_to root_url, alert: 'You are not authorized to perform the requested action!'
  end

  def set_user
    @user = current_user
  end

  def set_festival_dates
    year = Time.new.year
    if Time.new > Time.new("#{year}/07/01")
      @festivalStartDate = "#{year+1}/06/18"
      @festivalEndDate = "#{year+1}/07/01"
    else
      @festivalStartDate = "#{year}/06/18"
      @festivalEndDate = "#{year}/07/01"
    end
  end

  def application_locked?
    unless current_user.is_elevated?
      if @user.user_application and (@user.user_application.created_at + 1.days) <= DateTime.now
        redirect_because_application_is_locked
      end
    end
  end

  def redirect_because_application_is_locked
    flash[:error] = "Your application has already been sent to a coordinator and is therefore locked. If you still need to edit it, please contact a <a href='mailto:ottawajazzifycoordinator@gmail.com?subject=Edit%20Application&body=I%20registered%20as%20: " + current_user.email + "'>coordinator</a>."
    self.response_body = nil # This should resolve the redirect root.
    redirect_to(request.referrer || root_path)
  end

  if !Rails.env.production?
    ENV['two_factor_encryption_key'] = Rails.application.secrets.two_factor_encryption_key
  end

  def restrict_to_elevated
    # If user is not elevated, throw unauthorized
    raise Pundit::NotAuthorizedError unless current_user.is_elevated?
  end

  def restrict_to_admin
    # If user is not elevated, throw unauthorized
    raise Pundit::NotAuthorizedError unless current_user.is_admin?
  end

  # Notify admin with a link and body through PushBullet
  def notify_admins_link(title, body, link)
    require 'net/http'
    require "uri"
    uri = URI.parse('https://api.pushbullet.com/v2/pushes')
    request = Net::HTTP::Post.new(uri.to_s, {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ENV['PUSHBULLET_API_KEY']}"
        })
    request.set_form_data({
            'target': "#{ENV['MANDRILL_USERNAME']}",
            'type': 'link',
            'title': "#{title}",
            'body': "#{body}",
            'url': "#{root_url + link}"
          })
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http.request(request)
  end

  protected
  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :otp_attempt, :id, :remember_me) }
  end

end
