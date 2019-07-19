require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user with role user" do
    user = create(:user)
    
    user.set_default_role

    assert user.role = :user
  end
end
