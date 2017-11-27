require 'test_helper'

class TransactionSummaryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get transaction_summary_show_url
    assert_response :success
  end

end
