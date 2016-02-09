require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  def setup
    @profile = profile(:test_profile)
  end

  test "user_id should be present" do
    assert @profile.user_id.present?
  end

  test "about should be present" do
    assert @profile.about.present?
  end
end
