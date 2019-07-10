require 'test_helper'

class My::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_team = my_teams(:one)
  end

  test "should get index" do
    get my_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_my_team_url
    assert_response :success
  end

  test "should create my_team" do
    assert_difference('Team.count') do
      post my_teams_url, params: { my_team: {  } }
    end

    assert_redirected_to my_team_url(Team.last)
  end

  test "should show my_team" do
    get my_team_url(@my_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_team_url(@my_team)
    assert_response :success
  end

  test "should update my_team" do
    patch my_team_url(@my_team), params: { my_team: {  } }
    assert_redirected_to my_team_url(@my_team)
  end

  test "should destroy my_team" do
    assert_difference('Team.count', -1) do
      delete my_team_url(@my_team)
    end

    assert_redirected_to my_teams_url
  end
end
