class SessionsController < Devise::SessionsController
  prepend_before_filter :two_factor_enabled?, only: :create

  def two_factor
  end

  # POST /resource/sign_in
  def create
    if params[:user][:otp_attempt]
      self.resource = User.find(params[:user][:id])
      if !resource.valid_otp?(params[:user][:otp_attempt])
        flash[:alert] =  "Invalid Authentication Token"
        render :two_factor
      else
        return create_help
      end
    else
      self.resource = warden.authenticate!(auth_options)
      return create_help
    end
  end

  protected

  def two_factor_enabled?
    @user = User.find_by(email: params[:user][:email])
    unless params[:user][:otp_attempt].present?
      if @user && @user.valid_password?(params[:user][:password])
        self.resource = @user
        render :two_factor if resource.otp_required_for_login
      else
        warden.authenticate!(auth_options) # Fall back to warden authenticate when no user found
      end
    end
  end

  private

  def create_help
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
    return
  end

end
