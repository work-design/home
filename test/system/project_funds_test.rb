require "application_system_test_case"

class ProjectFundsTest < ApplicationSystemTestCase
  setup do
    @project_fund = project_funds(:one)
  end

  test "visiting the index" do
    visit project_funds_url
    assert_selector "h1", text: "Project Funds"
  end

  test "creating a Project fund" do
    visit project_funds_url
    click_on "New Project Fund"

    click_on "Create Project fund"

    assert_text "Project fund was successfully created"
    click_on "Back"
  end

  test "updating a Project fund" do
    visit project_funds_url
    click_on "Edit", match: :first

    click_on "Update Project fund"

    assert_text "Project fund was successfully updated"
    click_on "Back"
  end

  test "destroying a Project fund" do
    visit project_funds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project fund was successfully destroyed"
  end
end
