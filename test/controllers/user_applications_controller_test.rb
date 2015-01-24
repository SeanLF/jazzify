require 'test_helper'

class UserApplicationsControllerTest < ActionController::TestCase
  setup do
    @user_application = user_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_application" do
    assert_difference('UserApplication.count') do
      post :create, user_application: { user_application_status_id: @user_application.user_application_status_id, user_id: @user_application.user_id, volunteer_position_id: @user_application.volunteer_position_id }
    end

    assert_redirected_to user_application_path(assigns(:user_application))
  end

  test "should show user_application" do
    get :show, id: @user_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_application
    assert_response :success
  end

  test "should update user_application" do
    patch :update, id: @user_application, user_application: { user_application_status_id: @user_application.user_application_status_id, user_id: @user_application.user_id, volunteer_position_id: @user_application.volunteer_position_id }
    assert_redirected_to user_application_path(assigns(:user_application))
  end

  test "should destroy user_application" do
    assert_difference('UserApplication.count', -1) do
      delete :destroy, id: @user_application
    end

    assert_redirected_to user_applications_path
  end
end
