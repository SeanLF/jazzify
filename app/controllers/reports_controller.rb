class ReportsController < ApplicationController
  require 'axlsx'

  before_filter :authenticate_user!
  after_action :verify_authorized, except: :index
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized

  def index
    raise Pundit::NotAuthorizedError unless current_user.is_elevated?
  end

  def export_user_applications
    authorize current_user

    xlsx = Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: "User Applications") do |sheet|
        p.use_shared_strings = true
        # Headers
        sheet.add_row [
          'First Name',
          'Last Name',
          'Address',
          'City',
          'Province',
          'Postal Code',
          'Home Phone Number',
          'Work Phone Number',
          'Cell Phone Number',
          'Email',
          'T Shirt Size',
          'Age Group',
          'Emergency Contact Name',
          'Emergency Contact Number',
          'Notes',
          'Availability',
          'First Choice',
          'Second Choice',
          'Third Choice'
        ]

        # Get data data
        applications = UserApplication.all

        # Add a row for each
        applications.each do |application|
          sheet.add_row [
            application.user.user_information.first_name,
            application.user.user_information.last_name,
            application.user.user_information.address,
            application.user.user_information.city,
            application.user.user_information.province,
            application.user.user_information.postal_code.gsub(/[- ]/,''),
            application.user.user_information.home_phone_number.gsub(/[- ]/,''),
            application.user.user_information.work_phone_number.gsub(/[- ]/,''),
            application.user.user_information.cell_phone_number.gsub(/[- ]/,''),
            application.user.email,
            application.user.user_information.t_shirt_size,
            application.user.user_information.age_group,
            application.user.user_information.emergency_contact_name,
            application.user.user_information.emergency_contact_number,
            application.user.user_information.notes,
            "a:#{application.user.user_information.availability};u:#{application.user.user_information.unavailability}",
            application.first_choice_volunteer_position.title,
            application.second_choice_volunteer_position.title,
            application.third_choice_volunteer_position.title,
          ]
        end
      end
    end
    xlsx.serialize('/tmp/applications.xlsx')
    send_file('/tmp/applications.xlsx')
  end

end
