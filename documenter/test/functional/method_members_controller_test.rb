require 'test_helper'

class MethodMembersControllerTest < ActionController::TestCase
  setup do
    @method_member = method_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:method_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create method_member" do
    assert_difference('MethodMember.count') do
      post :create, method_member: { description: @method_member.description, name: @method_member.name, warning: @method_member.warning }
    end

    assert_redirected_to method_member_path(assigns(:method_member))
  end

  test "should show method_member" do
    get :show, id: @method_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @method_member
    assert_response :success
  end

  test "should update method_member" do
    put :update, id: @method_member, method_member: { description: @method_member.description, name: @method_member.name, warning: @method_member.warning }
    assert_redirected_to method_member_path(assigns(:method_member))
  end

  test "should destroy method_member" do
    assert_difference('MethodMember.count', -1) do
      delete :destroy, id: @method_member
    end

    assert_redirected_to method_members_path
  end
end
