require 'test_helper'

class WechatUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wechat_user = wechat_users(:one)
  end

  test "should get index" do
    get wechat_users_url
    assert_response :success
  end

  test "should get new" do
    get new_wechat_user_url
    assert_response :success
  end

  test "should create wechat_user" do
    assert_difference('WechatUser.count') do
      post wechat_users_url, params: { wechat_user: {  } }
    end

    assert_redirected_to wechat_user_url(WechatUser.last)
  end

  test "should show wechat_user" do
    get wechat_user_url(@wechat_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_wechat_user_url(@wechat_user)
    assert_response :success
  end

  test "should update wechat_user" do
    patch wechat_user_url(@wechat_user), params: { wechat_user: {  } }
    assert_redirected_to wechat_user_url(@wechat_user)
  end

  test "should destroy wechat_user" do
    assert_difference('WechatUser.count', -1) do
      delete wechat_user_url(@wechat_user)
    end

    assert_redirected_to wechat_users_url
  end
end
