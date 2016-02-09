require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "login and browse site" do
    # login via https
    https!
    get "/login"
    assert_response :success

    post_via_redirect "/login", username: users(:test_user).username, password: users(:test_user).password
    assert_equal '/welcome', path
    assert_equal 'Welcome Test User!', flash[:notice]

    https!(false)
    get "/"
    assert_response :success
  end
end
