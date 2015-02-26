class UsersController < ApplicationController

  respond_to do |format|
    format.html
    format.svg  { render :qrcode => request.url, :level => :l, :unit => 10 }
    format.png  { render :qrcode => request.url }
    format.gif  { render :qrcode => request.url }
    format.jpeg { render :qrcode => request.url }
  end

  def disable_otp
    current_user.otp_required_for_login = false
    current_user.save!
    @qr = nil
    redirect_to users_two_factor_authentication_path
  end

  def enable_otp
    require 'rqrcode'

    current_user.otp_secret = User.generate_otp_secret 16
    current_user.otp_required_for_login = true
    codes = current_user.generate_otp_backup_codes!
    current_user.save!
    uri = current_user.otp_provisioning_uri current_user.email, issuer: "Jazzify"
    @qr = RQRCode::QRCode.new( uri, :size => 5, :level => :l )
    render "two_factor_authentication"
  end
end
