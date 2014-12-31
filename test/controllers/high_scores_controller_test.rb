require 'test_helper'

class HighScoresControllerTest < ActionController::TestCase
  setup do
    @login_form = login_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:login_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create login_form" do
    assert_difference('HighScore.count') do
      post :create, login_form: { game: @login_form.game, score: @login_form.score }
    end

    assert_redirected_to login_form_path(assigns(:login_form))
  end

  test "should show login_form" do
    get :show, id: @login_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @login_form
    assert_response :success
  end

  test "should update login_form" do
    patch :update, id: @login_form, login_form: { game: @login_form.game, score: @login_form.score }
    assert_redirected_to login_form_path(assigns(:login_form))
  end

  test "should destroy login_form" do
    assert_difference('HighScore.count', -1) do
      delete :destroy, id: @login_form
    end

    assert_redirected_to login_forms_path
  end
end
