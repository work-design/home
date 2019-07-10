require 'test_helper'

class FacilitatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facilitate = facilitates(:one)
  end

  test "should get index" do
    get facilitates_url
    assert_response :success
  end

  test "should get new" do
    get new_facilitate_url
    assert_response :success
  end

  test "should create facilitate" do
    assert_difference('Facilitate.count') do
      post facilitates_url, params: { facilitate: {  } }
    end

    assert_redirected_to facilitate_url(Facilitate.last)
  end

  test "should show facilitate" do
    get facilitate_url(@facilitate)
    assert_response :success
  end

  test "should get edit" do
    get edit_facilitate_url(@facilitate)
    assert_response :success
  end

  test "should update facilitate" do
    patch facilitate_url(@facilitate), params: { facilitate: {  } }
    assert_redirected_to facilitate_url(@facilitate)
  end

  test "should destroy facilitate" do
    assert_difference('Facilitate.count', -1) do
      delete facilitate_url(@facilitate)
    end

    assert_redirected_to facilitates_url
  end
end
