require 'test_helper'

class SharedControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get shared_about_url
    assert_response :success
  end

  test "should get terms_of_service" do
    get shared_terms_of_service_url
    assert_response :success
  end

  test "should get privacy_policy" do
    get shared_privacy_policy_url
    assert_response :success
  end

  test "should get site_map" do
    get shared_site_map_url
    assert_response :success
  end

  test "should get contact_us" do
    get shared_contact_us_url
    assert_response :success
  end

  test "should get faq" do
    get shared_faq_url
    assert_response :success
  end

end
