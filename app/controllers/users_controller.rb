class UsersController < ApplicationController

  before_filter :authenticate_user!

  respond_to do |format|
    format.html
    format.svg  { render :qrcode => request.url, :level => :h }
    format.png  { render :qrcode => request.url }
    format.gif  { render :qrcode => request.url }
    format.jpeg { render :qrcode => request.url }
  end

  # Show page to disable 2fa
  def prepare_disable_2fa
    if current_user.otp_required_for_login
      render 'turn_off_two_factor_authentication'
    else
      flash[:alert] = "Two-factor authentication not enabled."
      redirect_to two_factor_authentication_path
    end
  end

  # Disables 2fa
  def disable_2fa
    # If the otp is present
    if params[:post][:otp_attempt]
      user = User.find(current_user.id)

      # Verify if otp is valid
      if !user.valid_otp?(params[:post][:otp_attempt])
        flash[:alert] = "Did not supply valid one time password."
        redirect_to two_factor_authentication_path
        return
      end

    else
      flash[:alert] = "Did not supply one time password."
      redirect_to two_factor_authentication_path
      return
    end

    # If we got here, the otp is valid
    current_user.otp_required_for_login = false
    current_user.otp_secret = nil
    current_user.save!
    redirect_to two_factor_authentication_path
  end

  # Setup 2fa page
  # Creates the secret and generates the QR code, user must verify to enable
  def setup_2fa

    # Return error if trial to set up 2fa when it's already enabled
    if current_user.otp_required_for_login
      flash[:alert] =  "You cannot setup 2FA again!"
      redirect_to two_factor_authentication_path
      return
    end

    require 'rqrcode'

    current_user.otp_secret = User.generate_otp_secret 32
    @codes = current_user.generate_otp_backup_codes!
    current_user.save!
    uri = current_user.otp_provisioning_uri current_user.email, issuer: "Jazzify"
    @qr = RQRCode::QRCode.new( uri, size: 10, :level => :h )
    render "turn_on_two_factor_authentication"
  end

  # Enable 2fa
  # If user provides valid 2fa token, enable 2fa for account
  def enable_2fa

    # If the otp is present
    if params[:post][:otp_attempt]
      user = User.find(current_user.id)

      # Verify if otp is valid
      if !user.valid_otp?(params[:post][:otp_attempt])
        return error_in_token_validation("Invalid Authentication Token")
      end

    else
      return error_in_token_validation("Missing Authentication Token")
    end

    # If we got here, the otp is valid
    @qr = nil
    current_user.otp_required_for_login = true
    current_user.save!
    render "two_factor_authentication"
  end

  private
  # Present the user with a flash alert message
  def error_in_token_validation(message = "Error")
    flash[:alert] = message
    return setup_2fa
  end
end
