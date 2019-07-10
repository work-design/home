require 'test_helper'

class Admin::SpaceTaxonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space_taxon = space_taxons(:one)
  end

  test "should get index" do
    get space_taxons_url
    assert_response :success
  end

  test "should get new" do
    get new_space_taxon_url
    assert_response :success
  end

  test "should create space_taxon" do
    assert_difference('SpaceTaxon.count') do
      post space_taxons_url, params: { space_taxon: {  } }
    end

    assert_redirected_to space_taxon_url(SpaceTaxon.last)
  end

  test "should show space_taxon" do
    get space_taxon_url(@space_taxon)
    assert_response :success
  end

  test "should get edit" do
    get edit_space_taxon_url(@space_taxon)
    assert_response :success
  end

  test "should update space_taxon" do
    patch space_taxon_url(@space_taxon), params: { space_taxon: {  } }
    assert_redirected_to space_taxon_url(@space_taxon)
  end

  test "should destroy space_taxon" do
    assert_difference('SpaceTaxon.count', -1) do
      delete space_taxon_url(@space_taxon)
    end

    assert_redirected_to space_taxons_url
  end
end
