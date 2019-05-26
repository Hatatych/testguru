require 'test_helper'

class UserBadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_badges_index_url
    assert_response :success
  end

end
