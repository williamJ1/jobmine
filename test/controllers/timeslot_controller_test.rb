require 'test_helper'

class TimeslotControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get timeslot_display_url
    assert_response :success
  end

  test "should get add" do
    get timeslot_add_url
    assert_response :success
  end

end
