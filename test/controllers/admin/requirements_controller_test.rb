require 'test_helper'
class Admin::RequirementsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @admin_requirement = create admin_requirements
  end

  test 'index ok' do
    get admin_requirements_url
    assert_response :success
  end

  test 'new ok' do
    get new_admin_requirement_url
    assert_response :success
  end

  test 'create ok' do
    assert_difference('Requirement.count') do
      post admin_requirements_url, params: { #{singular_table_name}: { #{attributes_string} } }
    end

    assert_response :success
  end

  test 'show ok' do
    get admin_requirement_url(@admin_requirement)
    assert_response :success
  end

  test 'edit ok' do
    get edit_admin_requirement_url(@admin_requirement)
    assert_response :success
  end

  test 'update ok' do
    patch admin_requirement_url(@admin_requirement), params: { #{singular_table_name}: { #{attributes_string} } }
    assert_response :success
  end

  test 'destroy ok' do
    assert_difference('Requirement.count', -1) do
      delete admin_requirement_url(@admin_requirement)
    end

    assert_response :success
  end

end
