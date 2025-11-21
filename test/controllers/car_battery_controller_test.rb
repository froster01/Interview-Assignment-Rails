require "test_helper"

class CarBatteryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_battery_index_url
    assert_response :success
  end

  test "should get show" do
    get car_battery_show_url
    assert_response :success
  end

  test "should get new" do
    get car_battery_new_url
    assert_response :success
  end

  test "should get create" do
    get car_battery_create_url
    assert_response :success
  end

  test "should get edit" do
    get car_battery_edit_url
    assert_response :success
  end

  test "should get update" do
    get car_battery_update_url
    assert_response :success
  end

  test "should get destroy" do
    get car_battery_destroy_url
    assert_response :success
  end
end
