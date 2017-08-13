require 'test_helper'

class MethodTypesControllerTest < ActionController::TestCase
  setup do
    @method_type = method_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:method_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create method_type" do
    assert_difference('MethodType.count') do
      post :create, method_type: { description: @method_type.description, name: @method_type.name }
    end

    assert_redirected_to method_type_path(assigns(:method_type))
  end

  test "should show method_type" do
    get :show, id: @method_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @method_type
    assert_response :success
  end

  test "should update method_type" do
    put :update, id: @method_type, method_type: { description: @method_type.description, name: @method_type.name }
    assert_redirected_to method_type_path(assigns(:method_type))
  end

  test "should destroy method_type" do
    assert_difference('MethodType.count', -1) do
      delete :destroy, id: @method_type
    end

    assert_redirected_to method_types_path
  end
end
