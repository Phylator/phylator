require 'test_helper'

class UnitOfMeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit_of_measurement = unit_of_measurements(:one)
  end

  test "should get index" do
    get unit_of_measurements_url
    assert_response :success
  end

  test "should get new" do
    get new_unit_of_measurement_url
    assert_response :success
  end

  test "should create unit_of_measurement" do
    assert_difference('UnitOfMeasurement.count') do
      post unit_of_measurements_url, params: { unit_of_measurement: {  } }
    end

    assert_redirected_to unit_of_measurement_url(UnitOfMeasurement.last)
  end

  test "should show unit_of_measurement" do
    get unit_of_measurement_url(@unit_of_measurement)
    assert_response :success
  end

  test "should get edit" do
    get edit_unit_of_measurement_url(@unit_of_measurement)
    assert_response :success
  end

  test "should update unit_of_measurement" do
    patch unit_of_measurement_url(@unit_of_measurement), params: { unit_of_measurement: {  } }
    assert_redirected_to unit_of_measurement_url(@unit_of_measurement)
  end

  test "should destroy unit_of_measurement" do
    assert_difference('UnitOfMeasurement.count', -1) do
      delete unit_of_measurement_url(@unit_of_measurement)
    end

    assert_redirected_to unit_of_measurements_url
  end
end
