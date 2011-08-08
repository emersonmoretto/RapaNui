require 'test_helper'

class OsControllerTest < ActionController::TestCase
  setup do
    @o = os(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:os)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create o" do
    assert_difference('Os.count') do
      post :create, :o => @o.attributes
    end

    assert_redirected_to o_path(assigns(:o))
  end

  test "should show o" do
    get :show, :id => @o.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @o.to_param
    assert_response :success
  end

  test "should update o" do
    put :update, :id => @o.to_param, :o => @o.attributes
    assert_redirected_to o_path(assigns(:o))
  end

  test "should destroy o" do
    assert_difference('Os.count', -1) do
      delete :destroy, :id => @o.to_param
    end

    assert_redirected_to os_index_path
  end
end
