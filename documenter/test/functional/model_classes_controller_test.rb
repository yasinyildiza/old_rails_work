require 'test_helper'

class ModelClassesControllerTest < ActionController::TestCase
  setup do
    @model_class = model_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model_class" do
    assert_difference('ModelClass.count') do
      post :create, model_class: { description: @model_class.description, name: @model_class.name, warning: @model_class.warning }
    end

    assert_redirected_to model_class_path(assigns(:model_class))
  end

  test "should show model_class" do
    get :show, id: @model_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model_class
    assert_response :success
  end

  test "should update model_class" do
    put :update, id: @model_class, model_class: { description: @model_class.description, name: @model_class.name, warning: @model_class.warning }
    assert_redirected_to model_class_path(assigns(:model_class))
  end

  test "should destroy model_class" do
    assert_difference('ModelClass.count', -1) do
      delete :destroy, id: @model_class
    end

    assert_redirected_to model_classes_path
  end
end
