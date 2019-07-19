require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should change user role" do
    admin_user = create(:user, role: 1)
    user = create(:user)
    sign_in admin_user

    get admin_user_change_role_url(user.id)

    follow_redirect!
    assert_equal admin_users_path, path
    assert_response :success

    get admin_user_change_role_url(user.id)

    follow_redirect!
    assert_equal admin_users_path, path
    assert_response :success

    sign_out admin_user
  end

  test "should fail to change user role" do
    user = create(:user, role: 1)
    sign_in user

    user_role = user.role

    get admin_user_change_role_url(user.id)

    follow_redirect!
    assert_equal admin_users_path, path
    assert_response :success

    assert user.role = user_role

    sign_out user
  end

  test "should get delete modal" do
    user = create(:user, role: 1)
    deletable_user = create(:user)

    sign_in user

    get delete_admin_user_url(deletable_user, format: :js), xhr: true

    assert_response :success

    sign_out user
  end

  test "should destroy user" do
    user = create(:user, role: 1)
    deletable_user = create(:user)

    sign_in user

    assert_difference "User.count", -1 do
      delete admin_user_url(deletable_user)

      follow_redirect!
      assert_equal admin_users_path, path
    end
    
    sign_out user
  end

  test "should fail to destroy user (user is admin)" do
    user = create(:user, role: 1)

    sign_in user
    assert_difference "User.count", 0 do
      delete admin_user_url(user)

      follow_redirect!
      assert_equal admin_users_path, path
      assert_response :success
    end

    sign_out user
  end
  
end