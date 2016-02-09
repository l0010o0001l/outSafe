require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = user(:test_user)
  end

  test "when user is created" do
    assert_difference 'Profile.count', +1 do
      User.create!(email: "test@example.com", password: "test!!!!", password_confirmation: "test!!!!")
    end
  end

  test "when user is destroyed" do
    assert_difference 'Profile.count', -1 do
      @user.destroy
    end
  end
end
