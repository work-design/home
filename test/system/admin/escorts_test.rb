require "application_system_test_case"

class EscortsTest < ApplicationSystemTestCase
  setup do
    @admin_escort = admin_escorts(:one)
  end

  test "visiting the index" do
    visit admin_escorts_url
    assert_selector "h1", text: "Escorts"
  end

  test "creating a Escort" do
    visit admin_escorts_url
    click_on "New Escort"

    fill_in "Car", with: @admin_escort.car
    fill_in "From address", with: @admin_escort.from_address
    fill_in "From mobile", with: @admin_escort.from_mobile
    fill_in "From name", with: @admin_escort.from_name
    fill_in "Goods", with: @admin_escort.goods
    fill_in "Note", with: @admin_escort.note
    fill_in "State", with: @admin_escort.state
    fill_in "To address", with: @admin_escort.to_address
    fill_in "To mobile", with: @admin_escort.to_mobile
    fill_in "To name", with: @admin_escort.to_name
    click_on "Create Escort"

    assert_text "Escort was successfully created"
    click_on "Back"
  end

  test "updating a Escort" do
    visit admin_escorts_url
    click_on "Edit", match: :first

    fill_in "Car", with: @admin_escort.car
    fill_in "From address", with: @admin_escort.from_address
    fill_in "From mobile", with: @admin_escort.from_mobile
    fill_in "From name", with: @admin_escort.from_name
    fill_in "Goods", with: @admin_escort.goods
    fill_in "Note", with: @admin_escort.note
    fill_in "State", with: @admin_escort.state
    fill_in "To address", with: @admin_escort.to_address
    fill_in "To mobile", with: @admin_escort.to_mobile
    fill_in "To name", with: @admin_escort.to_name
    click_on "Update Escort"

    assert_text "Escort was successfully updated"
    click_on "Back"
  end

  test "destroying a Escort" do
    visit admin_escorts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Escort was successfully destroyed"
  end
end
