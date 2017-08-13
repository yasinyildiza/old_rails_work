require 'test_helper'

class MethodParametersControllerTest < ActionController::TestCase
  setup do
    @method_parameter = method_parameters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:method_parameters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create method_parameter" do
    assert_difference('MethodParameter.count') do
      post :create, method_parameter: { description: @method_parameter.description, name: @method_parameter.name, warning: @method_parameter.warning }
    end

    assert_redirected_to method_parameter_path(assigns(:method_parameter))
  end

  test "should show method_parameter" do
    get :show, id: @method_parameter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @method_parameter
    assert_response :success
  end

  test "should update method_parameter" do
    put :update, id: @method_parameter, method_parameter: { description: @method_parameter.description, name: @method_parameter.name, warning: @method_parameter.warning }
    assert_redirected_to method_parameter_path(assigns(:method_parameter))
  end

  test "should destroy method_parameter" do
    assert_difference('MethodParameter.count', -1) do
      delete :destroy, id: @method_parameter
    end

    assert_redirected_to method_parameters_path
  end
end
