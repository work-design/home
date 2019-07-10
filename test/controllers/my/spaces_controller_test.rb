require 'test_helper'

class My::SpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_space = my_spaces(:one)
  end

  test "should get index" do
    get my_my_spaces_url
    assert_response :success
  end

  test "should get new" do
    get new_my_my_space_url
    assert_response :success
  end

  test "should create my_space" do
    assert_difference('My::Space.count') do
      post my_my_spaces_url, params: { my_space: {  } }
    end

    assert_redirected_to my_space_url(My::Space.last)
  end

  test "should show my_space" do
    get my_my_space_url(@my_space)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_my_space_url(@my_space)
    assert_response :success
  end

  test "should update my_space" do
    patch my_my_space_url(@my_space), params: { my_space: {  } }
    assert_redirected_to my_space_url(@my_space)
  end

  test "should destroy my_space" do
    assert_difference('My::Space.count', -1) do
      delete my_my_space_url(@my_space)
    end

    assert_redirected_to my_my_spaces_url
  end
end
