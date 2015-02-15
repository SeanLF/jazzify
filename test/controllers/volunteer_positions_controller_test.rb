require 'test_helper'

class VolunteerPositionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @user.role_id = 4
    @volunteer_position = volunteer_positions(:one)
    sign_in :user, @user
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:volunteer_positions)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create volunteer_position" do
  #   assert_difference('VolunteerPosition.count') do
  #     post :create, volunteer_position: { contact: @volunteer_position.contact, duties: @volunteer_position.duties, objective: @volunteer_position.objective, requirements: @volunteer_position.requirements, title: @volunteer_position.title }
  #   end

  #   assert_redirected_to volunteer_position_path(assigns(:volunteer_position))
  # end

  # test "should show volunteer_position" do
  #   get :show, id: @volunteer_position
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @volunteer_position
  #   assert_response :success
  # end

  # test "should update volunteer_position" do
  #   patch :update, id: @volunteer_position, volunteer_position: { contact: @volunteer_position.contact, duties: @volunteer_position.duties, objective: @volunteer_position.objective, requirements: @volunteer_position.requirements, title: @volunteer_position.title }
  #   assert_redirected_to volunteer_position_path(assigns(:volunteer_position))
  # end

  # test "should destroy volunteer_position" do
  #   assert_difference('VolunteerPosition.count', -1) do
  #     delete :destroy, id: @volunteer_position
  #   end

  #   assert_redirected_to volunteer_positions_path
  # end
end
