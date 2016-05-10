require 'test_helper'

class ComediansControllerTest < ActionController::TestCase
  setup do
    @comedian = comedians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comedians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comedian" do
    assert_difference('Comedian.count') do
      post :create, comedian: { name: @comedian.name, password: @comedian.password, username: @comedian.username }
    end

    assert_redirected_to comedian_path(assigns(:comedian))
  end

  test "should show comedian" do
    get :show, id: @comedian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comedian
    assert_response :success
  end

  test "should update comedian" do
    patch :update, id: @comedian, comedian: { name: @comedian.name, password: @comedian.password, username: @comedian.username }
    assert_redirected_to comedian_path(assigns(:comedian))
  end

  test "should destroy comedian" do
    assert_difference('Comedian.count', -1) do
      delete :destroy, id: @comedian
    end

    assert_redirected_to comedians_path
  end
end
