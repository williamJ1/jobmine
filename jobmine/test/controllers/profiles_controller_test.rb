require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get profiles_create_url
    assert_response :success
  end

  test "should get read" do
    get profiles_read_url
    assert_response :success
  end

  test "should get update" do
    get profiles_update_url
    assert_response :success
  end

  test "should get delete" do
    get profiles_delete_url
    assert_response :success
  end

end
