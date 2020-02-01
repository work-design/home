require 'test_helper'
class Admin::EscortsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @admin_escort = create admin_escorts
  end

  test 'index ok' do
    get admin_escorts_url
    assert_response :success
  end

  test 'new ok' do
    get new_admin_escort_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('Escort.count') do
      post admin_escorts_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_response :success
  end

  test 'show ok' do
    get admin_escort_url(@admin_escort)
    assert_response :success
  end

  test 'edit ok' do
    get edit_admin_escort_url(@admin_escort)
    assert_response :success
  end

  test 'update ok' do
    patch admin_escort_url(@admin_escort), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Escort.count', -1) do
      delete admin_escort_url(@admin_escort)
    end

    assert_response :success
  end

end
