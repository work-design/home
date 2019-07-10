require 'test_helper'

class OauthUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oauth_user = oauth_users(:one)
  end

  test "should get index" do
    get oauth_users_url
    assert_response :success
  end

  test "should get new" do
    get new_oauth_user_url
    assert_response :success
  end

  test "should create oauth_user" do
    assert_difference('OauthUser.count') do
      post oauth_users_url, params: { oauth_user: {  } }
    end

    assert_redirected_to oauth_user_url(OauthUser.last)
  end

  test "should show oauth_user" do
    get oauth_user_url(@oauth_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_oauth_user_url(@oauth_user)
    assert_response :success
  end

  test "should update oauth_user" do
    patch oauth_user_url(@oauth_user), params: { oauth_user: {  } }
    assert_redirected_to oauth_user_url(@oauth_user)
  end

  test "should destroy oauth_user" do
    assert_difference('OauthUser.count', -1) do
      delete oauth_user_url(@oauth_user)
    end

    assert_redirected_to oauth_users_url
  end
end
