require 'test_helper'

class UserOperationsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get user_operations_search_url
    assert_response :success
  end

  test "should get friend_request" do
    get user_operations_friend_request_url
    assert_response :success
  end

  test "should get messages" do
    get user_operations_messages_url
    assert_response :success
  end

  test "should get notifications" do
    get user_operations_notifications_url
    assert_response :success
  end

end
