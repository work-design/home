require 'test_helper'
class Admin::VolunteersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @admin_volunteer = create admin_volunteers
  end

  test 'index ok' do
    get admin_volunteers_url
    assert_response :success
  end

  test 'new ok' do
    get new_admin_volunteer_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('Volunteer.count') do
      post admin_volunteers_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_response :success
  end

  test 'show ok' do
    get admin_volunteer_url(@admin_volunteer)
    assert_response :success
  end

  test 'edit ok' do
    get edit_admin_volunteer_url(@admin_volunteer)
    assert_response :success
  end

  test 'update ok' do
    patch admin_volunteer_url(@admin_volunteer), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Volunteer.count', -1) do
      delete admin_volunteer_url(@admin_volunteer)
    end

    assert_response :success
  end

end
