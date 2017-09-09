require 'test_helper'

class Calculation::MeasurementsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get calculation_measurements_show_url
    assert_response :success
  end

end
