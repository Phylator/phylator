require 'test_helper'

class EquationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equation = equations(:one)
  end

  test "should get index" do
    get equations_url
    assert_response :success
  end

  test "should get new" do
    get new_equation_url
    assert_response :success
  end

  test "should create equation" do
    assert_difference('Equation.count') do
      post equations_url, params: { equation: {  } }
    end

    assert_redirected_to equation_url(Equation.last)
  end

  test "should show equation" do
    get equation_url(@equation)
    assert_response :success
  end

  test "should get edit" do
    get edit_equation_url(@equation)
    assert_response :success
  end

  test "should update equation" do
    patch equation_url(@equation), params: { equation: {  } }
    assert_redirected_to equation_url(@equation)
  end

  test "should destroy equation" do
    assert_difference('Equation.count', -1) do
      delete equation_url(@equation)
    end

    assert_redirected_to equations_url
  end
end
