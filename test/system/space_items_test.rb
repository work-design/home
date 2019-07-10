require "application_system_test_case"

class SpaceItemsTest < ApplicationSystemTestCase
  setup do
    @space_item = space_items(:one)
  end

  test "visiting the index" do
    visit space_items_url
    assert_selector "h1", text: "Space Items"
  end

  test "creating a Space item" do
    visit space_items_url
    click_on "New Space Item"

    click_on "Create Space item"

    assert_text "Space item was successfully created"
    click_on "Back"
  end

  test "updating a Space item" do
    visit space_items_url
    click_on "Edit", match: :first

    click_on "Update Space item"

    assert_text "Space item was successfully updated"
    click_on "Back"
  end

  test "destroying a Space item" do
    visit space_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Space item was successfully destroyed"
  end
end
