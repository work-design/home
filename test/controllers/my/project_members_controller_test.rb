require 'test_helper'

class ProjectMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_member = project_members(:one)
  end

  test "should get index" do
    get project_members_url
    assert_response :success
  end

  test "should get new" do
    get new_project_member_url
    assert_response :success
  end

  test "should create project_member" do
    assert_difference('ProjectMember.count') do
      post project_members_url, params: { project_member: {  } }
    end

    assert_redirected_to project_member_url(ProjectMember.last)
  end

  test "should show project_member" do
    get project_member_url(@project_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_member_url(@project_member)
    assert_response :success
  end

  test "should update project_member" do
    patch project_member_url(@project_member), params: { project_member: {  } }
    assert_redirected_to project_member_url(@project_member)
  end

  test "should destroy project_member" do
    assert_difference('ProjectMember.count', -1) do
      delete project_member_url(@project_member)
    end

    assert_redirected_to project_members_url
  end
end
