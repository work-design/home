require 'test_helper'

class ProjectTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_team = project_teams(:one)
  end

  test "should get index" do
    get project_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_project_team_url
    assert_response :success
  end

  test "should create project_team" do
    assert_difference('ProjectTeam.count') do
      post project_teams_url, params: { project_team: {  } }
    end

    assert_redirected_to project_team_url(ProjectTeam.last)
  end

  test "should show project_team" do
    get project_team_url(@project_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_team_url(@project_team)
    assert_response :success
  end

  test "should update project_team" do
    patch project_team_url(@project_team), params: { project_team: {  } }
    assert_redirected_to project_team_url(@project_team)
  end

  test "should destroy project_team" do
    assert_difference('ProjectTeam.count', -1) do
      delete project_team_url(@project_team)
    end

    assert_redirected_to project_teams_url
  end
end
