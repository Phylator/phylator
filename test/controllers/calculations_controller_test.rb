require 'test_helper'

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calculation = calculations(:one)
  end

  test "should get index" do
    get calculations_url
    assert_response :success
  end

  test "should get new" do
    get new_calculation_url
    assert_response :success
  end

  test "should create calculation" do
    assert_difference('Calculation.count') do
      post calculations_url, params: { calculation: {  } }
    end

    assert_redirected_to calculation_url(Calculation.last)
  end

  test "should show calculation" do
    get calculation_url(@calculation)
    assert_response :success
  end

  test "should get edit" do
    get edit_calculation_url(@calculation)
    assert_response :success
  end

  test "should update calculation" do
    patch calculation_url(@calculation), params: { calculation: {  } }
    assert_redirected_to calculation_url(@calculation)
  end

  test "should destroy calculation" do
    assert_difference('Calculation.count', -1) do
      delete calculation_url(@calculation)
    end

    assert_redirected_to calculations_url
  end
end
