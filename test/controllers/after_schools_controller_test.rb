require 'test_helper'

class AfterSchoolsControllerTest < ActionController::TestCase
  setup do
    @after_school = after_schools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:after_schools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create after_school" do
    assert_difference('AfterSchool.count') do
      post :create, after_school: { date: @after_school.date, goal: @after_school.goal, guardian_id: @after_school.guardian_id, homework_time: @after_school.homework_time, literacy_time: @after_school.literacy_time, program_id: @after_school.program_id, reading_specialist_time: @after_school.reading_specialist_time, technology_time: @after_school.technology_time, time_in: @after_school.time_in, time_out: @after_school.time_out, total_hours: @after_school.total_hours }
    end

    assert_redirected_to after_school_path(assigns(:after_school))
  end

  test "should show after_school" do
    get :show, id: @after_school
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @after_school
    assert_response :success
  end

  test "should update after_school" do
    patch :update, id: @after_school, after_school: { date: @after_school.date, goal: @after_school.goal, guardian_id: @after_school.guardian_id, homework_time: @after_school.homework_time, literacy_time: @after_school.literacy_time, program_id: @after_school.program_id, reading_specialist_time: @after_school.reading_specialist_time, technology_time: @after_school.technology_time, time_in: @after_school.time_in, time_out: @after_school.time_out, total_hours: @after_school.total_hours }
    assert_redirected_to after_school_path(assigns(:after_school))
  end

  test "should destroy after_school" do
    assert_difference('AfterSchool.count', -1) do
      delete :destroy, id: @after_school
    end

    assert_redirected_to after_schools_path
  end
end
