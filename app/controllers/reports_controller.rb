class ReportsController < ApplicationController
  require 'axlsx'
  include UserInformationsHelper

  before_filter :authenticate_user!
  before_action :bar_access_to_unauthorized
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def export_user_applications
    xlsx = Axlsx::Package.new do |p|
      p.workbook.add_worksheet(name: "User Applications") do |sheet|
        p.use_shared_strings = true

        # Headers
        sheet.add_row get_user_application_export_headers

        # Get data
        if params[:volunteer_position]
          applications = UserApplication.export_for_position(params[:volunteer_position][:id].to_i)
        else
          applications = UserApplication.export
        end

        # Export
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
    @sizes = infos.uniq.pluck(:t_shirt_size)
    @distribution = {}
    @sizes.each do |size|
      count = infos.where("t_shirt_size = ?", size).count
      @distribution[size] = count
    end
  end

  # Pie chart showing frequency of users logged in during time frames
  def user_last_sign_in_at
    @colors = ['#F7464A', '#46BFBD', '#FFC870', '#949FB1']
    one_week_where_clause = "last_sign_in_at > LOCALTIMESTAMP - INTERVAL '1 WEEK'"
    two_weeks_where_clause = "last_sign_in_at BETWEEN LOCALTIMESTAMP - INTERVAL '2 WEEKS' AND LOCALTIMESTAMP - INTERVAL '1 WEEK'"
    under_a_month_where_clause = "last_sign_in_at BETWEEN LOCALTIMESTAMP - INTERVAL '1 MONTH' AND LOCALTIMESTAMP - INTERVAL '2 WEEKS'"
    over_a_month_where_clause = "last_sign_in_at < LOCALTIMESTAMP - INTERVAL '1 MONTH'"
    get_counts_for_users_sign_in_report(one_week_where_clause, two_weeks_where_clause, under_a_month_where_clause, over_a_month_where_clause)
  end

  def user_sign_up_distribution
    @months = User.pluck("date_trunc('month',DATE(created_at))")
    @month_names = []
    @month_counts = {}
    @months.uniq.each_with_index do |date, index|
      @month_names[index] = Date::MONTHNAMES[date.month]
      @month_counts[@month_names[index]] = @months.count(date)
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
            'Emergency Contact Name', 'Emergency Contact Number', 'Notes', 'Availability', 'Unavailability',
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

  def add_data_to_sheet_for_export_applications(sheet, rows)
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
        format_availability_dates(row.availability).join(',
'),
        format_availability_dates(row.unavailability).join(',
'),
        row.first_choice,
        row.second_choice,
        row.third_choice
      ]
    end
  end

  def get_counts_for_users_sign_in_report(one_week_where_clause, two_weeks_where_clause, under_a_month_where_clause, over_a_month_where_clause)
    @counts = {
      "One Week": User.where(one_week_where_clause).count,
      "Two Weeks": User.where(two_weeks_where_clause).count,
      "Under a month": User.where(under_a_month_where_clause).count,
      "Over a month": User.where(over_a_month_where_clause).count
    }
  end
end
