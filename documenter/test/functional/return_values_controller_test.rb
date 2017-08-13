require 'test_helper'

class ReturnValuesControllerTest < ActionController::TestCase
  setup do
    @return_value = return_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:return_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create return_value" do
    assert_difference('ReturnValue.count') do
      post :create, return_value: { description: @return_value.description, name: @return_value.name, warning: @return_value.warning }
    end

    assert_redirected_to return_value_path(assigns(:return_value))
  end

  test "should show return_value" do
    get :show, id: @return_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @return_value
    assert_response :success
  end

  test "should update return_value" do
    put :update, id: @return_value, return_value: { description: @return_value.description, name: @return_value.name, warning: @return_value.warning }
    assert_redirected_to return_value_path(assigns(:return_value))
  end

  test "should destroy return_value" do
    assert_difference('ReturnValue.count', -1) do
      delete :destroy, id: @return_value
    end

    assert_redirected_to return_values_path
  end
end
