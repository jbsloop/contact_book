require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should reject access" do
    user = create(:user)

    sign_in user

    get admin_users_url

    follow_redirect!
    assert_equal "/404.html", path

    sign_out user
  end

  test "should allow access" do
    user = create(:user, role: 1)

    sign_in user

    get admin_users_url

    assert_response :success

    sign_out user
  end
end
