require "test_helper"

class Teachers::SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teachers_session_new_url
    assert_response :success
  end
end
