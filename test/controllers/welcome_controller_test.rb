require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

  test "should get sign_up" do
    get :sign_up
    assert_response :success
  end

  test "should get startup" do
    get :startup
    assert_response :success
  end

end
