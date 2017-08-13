require 'test_helper'

class DataMembersControllerTest < ActionController::TestCase
  setup do
    @data_member = data_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:data_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create data_member" do
    assert_difference('DataMember.count') do
      post :create, data_member: { calculation: @data_member.calculation, description: @data_member.description, name: @data_member.name, warning: @data_member.warning }
    end

    assert_redirected_to data_member_path(assigns(:data_member))
  end

  test "should show data_member" do
    get :show, id: @data_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @data_member
    assert_response :success
  end

  test "should update data_member" do
    put :update, id: @data_member, data_member: { calculation: @data_member.calculation, description: @data_member.description, name: @data_member.name, warning: @data_member.warning }
    assert_redirected_to data_member_path(assigns(:data_member))
  end

  test "should destroy data_member" do
    assert_difference('DataMember.count', -1) do
      delete :destroy, id: @data_member
    end

    assert_redirected_to data_members_path
  end
end
