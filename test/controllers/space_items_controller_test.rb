require 'test_helper'

class SpaceItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space_item = space_items(:one)
  end

  test "should get index" do
    get space_items_url
    assert_response :success
  end

  test "should get new" do
    get new_space_item_url
    assert_response :success
  end

  test "should create space_item" do
    assert_difference('SpaceItem.count') do
      post space_items_url, params: { space_item: {  } }
    end

    assert_redirected_to space_item_url(SpaceItem.last)
  end

  test "should show space_item" do
    get space_item_url(@space_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_space_item_url(@space_item)
    assert_response :success
  end

  test "should update space_item" do
    patch space_item_url(@space_item), params: { space_item: {  } }
    assert_redirected_to space_item_url(@space_item)
  end

  test "should destroy space_item" do
    assert_difference('SpaceItem.count', -1) do
      delete space_item_url(@space_item)
    end

    assert_redirected_to space_items_url
  end
end
