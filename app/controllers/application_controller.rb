class ApplicationController < ActionController::Base
 
  # Includes Authorization mechanism
  include Pundit
 
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
 
end