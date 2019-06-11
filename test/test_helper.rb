ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def login_as(user)
      post user_session_path, params: { email: user.email, password: 'secret' }
  end

  def logout
    delete destroy_user_session_path
  end

  def setup
    login_as users(:one)
  end
end
