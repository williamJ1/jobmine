require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contracts_create_url
    assert_response :success
  end

end
