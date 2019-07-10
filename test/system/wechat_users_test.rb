require "application_system_test_case"

class WechatUsersTest < ApplicationSystemTestCase
  setup do
    @wechat_user = wechat_users(:one)
  end

  test "visiting the index" do
    visit wechat_users_url
    assert_selector "h1", text: "Wechat Users"
  end

  test "creating a Wechat user" do
    visit wechat_users_url
    click_on "New Wechat User"

    click_on "Create Wechat user"

    assert_text "Wechat user was successfully created"
    click_on "Back"
  end

  test "updating a Wechat user" do
    visit wechat_users_url
    click_on "Edit", match: :first

    click_on "Update Wechat user"

    assert_text "Wechat user was successfully updated"
    click_on "Back"
  end

  test "destroying a Wechat user" do
    visit wechat_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wechat user was successfully destroyed"
  end
end
