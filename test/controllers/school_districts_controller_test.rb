require 'test_helper'

class SchoolDistrictsControllerTest < ActionController::TestCase
  setup do
    @school_district = school_districts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_district" do
    assert_difference('SchoolDistrict.count') do
      post :create, school_district: { name: @school_district.name }
    end

    assert_redirected_to school_district_path(assigns(:school_district))
  end

  test "should show school_district" do
    get :show, id: @school_district
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_district
    assert_response :success
  end

  test "should update school_district" do
    patch :update, id: @school_district, school_district: { name: @school_district.name }
    assert_redirected_to school_district_path(assigns(:school_district))
  end

  test "should destroy school_district" do
    assert_difference('SchoolDistrict.count', -1) do
      delete :destroy, id: @school_district
    end

    assert_redirected_to school_districts_path
  end
end
