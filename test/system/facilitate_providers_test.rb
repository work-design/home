require "application_system_test_case"

class FacilitateProvidersTest < ApplicationSystemTestCase
  setup do
    @facilitate_provider = facilitate_providers(:one)
  end

  test "visiting the index" do
    visit facilitate_providers_url
    assert_selector "h1", text: "Facilitate Providers"
  end

  test "creating a Facilitate provider" do
    visit facilitate_providers_url
    click_on "New Facilitate Provider"

    click_on "Create Facilitate provider"

    assert_text "Facilitate provider was successfully created"
    click_on "Back"
  end

  test "updating a Facilitate provider" do
    visit facilitate_providers_url
    click_on "Edit", match: :first

    click_on "Update Facilitate provider"

    assert_text "Facilitate provider was successfully updated"
    click_on "Back"
  end

  test "destroying a Facilitate provider" do
    visit facilitate_providers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facilitate provider was successfully destroyed"
  end
end
