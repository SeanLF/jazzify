require 'test_helper'

class UserInformationsControllerTest < ActionController::TestCase
  setup do
    @user_information = user_informations(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:user_informations)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create user_information" do
  #   assert_difference('UserInformation.count') do
  #     post :create, user_information: { address: @user_information.address, age_group: @user_information.age_group, cell_phone_number: @user_information.cell_phone_number, city: @user_information.city, emergency_contact_name: @user_information.emergency_contact_name, emergency_contact_number: @user_information.emergency_contact_number, first_name: @user_information.first_name, home_phone_number: @user_information.home_phone_number, last_name: @user_information.last_name, notes: @user_information.notes, postal_code: @user_information.postal_code, province: @user_information.province, t_shirt_size: @user_information.t_shirt_size, user_id: @user_information.user_id, work_phone_number: @user_information.work_phone_number }
  #   end

  #   assert_redirected_to user_information_path(assigns(:user_information))
  # end

  # test "should show user_information" do
  #   get :show, id: @user_information
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @user_information
  #   assert_response :success
  # end

  # test "should update user_information" do
  #   patch :update, id: @user_information, user_information: { address: @user_information.address, age_group: @user_information.age_group, cell_phone_number: @user_information.cell_phone_number, city: @user_information.city, emergency_contact_name: @user_information.emergency_contact_name, emergency_contact_number: @user_information.emergency_contact_number, first_name: @user_information.first_name, home_phone_number: @user_information.home_phone_number, last_name: @user_information.last_name, notes: @user_information.notes, postal_code: @user_information.postal_code, province: @user_information.province, t_shirt_size: @user_information.t_shirt_size, user_id: @user_information.user_id, work_phone_number: @user_information.work_phone_number }
  #   assert_redirected_to user_information_path(assigns(:user_information))
  # end

  # test "should destroy user_information" do
  #   assert_difference('UserInformation.count', -1) do
  #     delete :destroy, id: @user_information
  #   end

  #   assert_redirected_to user_informations_path
  # end
end
