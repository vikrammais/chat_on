require 'test_helper'

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show_messages" do
    get conversations_show_messages_url
    assert_response :success
  end

  test "should get send_message" do
    get conversations_send_message_url
    assert_response :success
  end

end
