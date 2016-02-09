require 'test_helper'

class PartiesControllerTest < ActionController::TestCase
  test "should create party" do
    assert_difference('Party.count') do
      post :create, party: {title: 'Terrible Coffee', address: 'My Basement'}
    end
    assert_redirected_to party_path(assigns(:party))
    assert_equal 'Party was successfully created.',
    flash[:notice]
  end

  test "associate current_user id on create" do
    flunk
  end
end
