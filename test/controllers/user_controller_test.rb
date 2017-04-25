require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get user_data" do
    get user_user_data_url
    assert_response :success
  end

  test "should get friends_list" do
    get user_friends_list_url
    assert_response :success
  end

end
