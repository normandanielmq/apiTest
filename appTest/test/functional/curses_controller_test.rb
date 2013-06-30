require 'test_helper'

class CursesControllerTest < ActionController::TestCase
  setup do
    @curse = curses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:curses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create curse" do
    assert_difference('Curse.count') do
      post :create, curse: @curse.attributes
    end

    assert_redirected_to curse_path(assigns(:curse))
  end

  test "should show curse" do
    get :show, id: @curse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @curse
    assert_response :success
  end

  test "should update curse" do
    put :update, id: @curse, curse: @curse.attributes
    assert_redirected_to curse_path(assigns(:curse))
  end

  test "should destroy curse" do
    assert_difference('Curse.count', -1) do
      delete :destroy, id: @curse
    end

    assert_redirected_to curses_path
  end
end
