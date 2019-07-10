require 'test_helper'

class FacilitateProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facilitate_provider = facilitate_providers(:one)
  end

  test "should get index" do
    get facilitate_providers_url
    assert_response :success
  end

  test "should get new" do
    get new_facilitate_provider_url
    assert_response :success
  end

  test "should create facilitate_provider" do
    assert_difference('FacilitateProvider.count') do
      post facilitate_providers_url, params: { facilitate_provider: {  } }
    end

    assert_redirected_to facilitate_provider_url(FacilitateProvider.last)
  end

  test "should show facilitate_provider" do
    get facilitate_provider_url(@facilitate_provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_facilitate_provider_url(@facilitate_provider)
    assert_response :success
  end

  test "should update facilitate_provider" do
    patch facilitate_provider_url(@facilitate_provider), params: { facilitate_provider: {  } }
    assert_redirected_to facilitate_provider_url(@facilitate_provider)
  end

  test "should destroy facilitate_provider" do
    assert_difference('FacilitateProvider.count', -1) do
      delete facilitate_provider_url(@facilitate_provider)
    end

    assert_redirected_to facilitate_providers_url
  end
end
