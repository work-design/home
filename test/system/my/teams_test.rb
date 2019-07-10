require "application_system_test_case"

class TeamsTest < ApplicationSystemTestCase
  setup do
    @my_team = my_teams(:one)
  end

  test "visiting the index" do
    visit my_teams_url
    assert_selector "h1", text: "Teams"
  end

  test "creating a Team" do
    visit my_teams_url
    click_on "New Team"

    click_on "Create Team"

    assert_text "Team was successfully created"
    click_on "Back"
  end

  test "updating a Team" do
    visit my_teams_url
    click_on "Edit", match: :first

    click_on "Update Team"

    assert_text "Team was successfully updated"
    click_on "Back"
  end

  test "destroying a Team" do
    visit my_teams_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Team was successfully destroyed"
  end
end
