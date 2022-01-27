require 'test_helper'

class User::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_inquiries_index_url
    assert_response :success
  end

  test "should get confirm" do
    get user_inquiries_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get user_inquiries_thanks_url
    assert_response :success
  end

end
