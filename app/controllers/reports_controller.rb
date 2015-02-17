class ReportsController < ApplicationController
  require 'axlsx'

  before_filter :authenticate_user!
  before_action :bar_access_to_unauthorized
  rescue_from Pundit::NotAuthorizedError, :with => :not_authorized

  def index
    raise Pundit::NotAuthorizedError unless current_user.is_elevated?
  end

  def export_user_applications
    xlsx = Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: "User Applications") do |sheet|
        p.use_shared_strings = true
        # Headers
        sheet.add_row get_user_application_export_headers

        # Get data data
        applications = UserApplication.all

        # Add data
        add_data_to_sheet_for_export_applications(sheet, applications)
      end
    end
    xlsx.serialize('/tmp/applications.xlsx')
    send_file('/tmp/applications.xlsx')
  end

  # Radar chart for volunteer position picks
  def radar_chart_position_picks

    # Get data
    all_applications = UserApplication.all
    all_positions = VolunteerPosition.all

    # Initialize hashes
    initialize_hash_for_radar_chart(all_applications, all_positions)

    # # Insert data


    # all_applications.each do |application|
    #   @choices[@x[0]]["#{application.first_choice_volunteer_position.title}"] += 1
    #   @choices[@x[1]]["#{application.second_choice_volunteer_position.title}"] += 1
    #   @choices[@x[2]]["#{application.third_choice_volunteer_position.title}"] += 1
    # end
  end

  # bar plot how many users have registered, completed info, and applied
  def user_completion
    @users = User.all.count
    @infos = UserInformation.all.count
    @apps = UserApplication.all.count
  end

  # doughnut chart: distribution of t shirt sizes
  def t_shirt_distribution
    infos = UserInformation.all
    @sizes = infos.select('distinct t_shirt_size')
    @distribution = {}
    @sizes.each do |user_info|
      size = user_info.t_shirt_size.to_s
      count = infos.where("t_shirt_size = ?", user_info.t_shirt_size.to_s).count
      @distribution[size] = count
    end
  end

  private
  def bar_access_to_unauthorized
    # If user is not elevated, throw unauthorized
    raise Pundit::NotAuthorizedError unless current_user.is_elevated?
  end

  def get_user_application_export_headers
    return ['First Name', 'Last Name', 'Address', 'City',
          'Province', 'Postal Code', 'Home Phone Number', 'Work Phone Number',
          'Cell Phone Number', 'Email', 'T Shirt Size', 'Age Group',
          'Emergency Contact Name', 'Emergency Contact Number', 'Notes', 'Availability',
          'First Choice', 'Second Choice', 'Third Choice']
  end

  def initialize_hash_for_radar_chart(all_applications, all_positions)

    @x = {first_choice_volunteer_position_id: "First Choice", second_choice_volunteer_position_id: "Second Choice", third_choice_volunteer_position_id: "Third Choice"}
    @choices = {}
    @x.each do |num|
      @choices[num[1]] = {}
      all_positions.each do |position|
        @choices[num[1]]["#{position.title}"] = UserApplication.where(num[0] => position.id.to_s).count
      end
    end
  end

  def add_data_to_sheet_for_export_applications(sheet, applications)

    # Get info once, not multiple times
    rows = get_data_for_export_applications

    rows.each do |row|
      sheet.add_row  [
        row.first_name,
        row.last_name,
        row.address,
        row.city,
        row.province,
        row.postal_code.gsub(/[- ]/,''),
        row.home_phone_number.gsub(/[- ]/,''),
        row.work_phone_number.gsub(/[- ]/,''),
        row.cell_phone_number.gsub(/[- ]/,''),
        row.email,
        row.t_shirt_size,
        row.age_group,
        row.emergency_contact_name,
        row.emergency_contact_number,
        row.notes,
        "a:#{row.availability};u:#{row.unavailability}",
        row.c1,
        row.c2,
        row.c3
      ]
    end
  end

  def get_data_for_export_applications
    return UserApplication.joins("inner join Users on cast(users.id as text) = user_applications.user_id")
        .joins("inner join User_informations on user_informations.user_id = cast(users.id as text)")
        .select("user_informations.first_name, user_informations.last_name, user_informations.address,
          user_informations.city, user_informations.province, user_informations.postal_code,
          user_informations.home_phone_number, user_informations.work_phone_number,
          user_informations.cell_phone_number,users.email, user_informations.t_shirt_size,
          user_informations.age_group, user_informations.emergency_contact_name,
          user_informations.emergency_contact_number, user_informations.notes,
          user_informations.availability,user_informations.unavailability,
          (select title as c1 from volunteer_positions as v where cast(v.id as text) =
            user_applications.first_choice_volunteer_position_id),
          (select title as c2 from volunteer_positions as v where cast(v.id as text) =
            user_applications.second_choice_volunteer_position_id),
          (select title as c3 from volunteer_positions as v where cast(v.id as text) =
           user_applications.third_choice_volunteer_position_id)")
  end
end
