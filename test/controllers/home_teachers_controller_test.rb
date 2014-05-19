require 'test_helper'

class HomeTeachersControllerTest < ActionController::TestCase
  setup do
    @home_teacher = home_teachers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_teacher" do
    assert_difference('HomeTeacher.count') do
      post :create, home_teacher: { name: @home_teacher.name }
    end

    assert_redirected_to home_teacher_path(assigns(:home_teacher))
  end

  test "should show home_teacher" do
    get :show, id: @home_teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_teacher
    assert_response :success
  end

  test "should update home_teacher" do
    patch :update, id: @home_teacher, home_teacher: { name: @home_teacher.name }
    assert_redirected_to home_teacher_path(assigns(:home_teacher))
  end

  test "should destroy home_teacher" do
    assert_difference('HomeTeacher.count', -1) do
      delete :destroy, id: @home_teacher
    end

    assert_redirected_to home_teachers_path
  end
end
