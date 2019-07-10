require "application_system_test_case"

class SpaceTaxonsTest < ApplicationSystemTestCase
  setup do
    @space_taxon = space_taxons(:one)
  end

  test "visiting the index" do
    visit space_taxons_url
    assert_selector "h1", text: "Space Taxons"
  end

  test "creating a Space taxon" do
    visit space_taxons_url
    click_on "New Space Taxon"

    click_on "Create Space taxon"

    assert_text "Space taxon was successfully created"
    click_on "Back"
  end

  test "updating a Space taxon" do
    visit space_taxons_url
    click_on "Edit", match: :first

    click_on "Update Space taxon"

    assert_text "Space taxon was successfully updated"
    click_on "Back"
  end

  test "destroying a Space taxon" do
    visit space_taxons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Space taxon was successfully destroyed"
  end
end
