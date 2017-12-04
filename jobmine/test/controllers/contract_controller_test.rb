require 'test_helper'

class ContractControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get contract_create_url
    assert_response :success
  end

end
