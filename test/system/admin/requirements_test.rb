require "application_system_test_case"

class RequirementsTest < ApplicationSystemTestCase
  setup do
    @admin_requirement = admin_requirements(:one)
  end

  test "visiting the index" do
    visit admin_requirements_url
    assert_selector "h1", text: "Requirements"
  end

  test "creating a Requirement" do
    visit admin_requirements_url
    click_on "New Requirement"

    fill_in "From", with: @admin_requirement.from
    fill_in "Mobile", with: @admin_requirement.mobile
    fill_in "Name", with: @admin_requirement.name
    fill_in "Note", with: @admin_requirement.note
    fill_in "Pick at", with: @admin_requirement.pick_at
    fill_in "Pick on", with: @admin_requirement.pick_on
    fill_in "To", with: @admin_requirement.to
    click_on "Create Requirement"

    assert_text "Requirement was successfully created"
    click_on "Back"
  end

  test "updating a Requirement" do
    visit admin_requirements_url
    click_on "Edit", match: :first

    fill_in "From", with: @admin_requirement.from
    fill_in "Mobile", with: @admin_requirement.mobile
    fill_in "Name", with: @admin_requirement.name
    fill_in "Note", with: @admin_requirement.note
    fill_in "Pick at", with: @admin_requirement.pick_at
    fill_in "Pick on", with: @admin_requirement.pick_on
    fill_in "To", with: @admin_requirement.to
    click_on "Update Requirement"

    assert_text "Requirement was successfully updated"
    click_on "Back"
  end

  test "destroying a Requirement" do
    visit admin_requirements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Requirement was successfully destroyed"
  end
end
