require 'test_helper'

class TeenJobDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get teen_job_detail_show_url
    assert_response :success
  end

end
