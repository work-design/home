require 'test_helper'

class ProjectFundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_fund = project_funds(:one)
  end

  test "should get index" do
    get project_funds_url
    assert_response :success
  end

  test "should get new" do
    get new_project_fund_url
    assert_response :success
  end

  test "should create project_fund" do
    assert_difference('ProjectFund.count') do
      post project_funds_url, params: { project_fund: {  } }
    end

    assert_redirected_to project_fund_url(ProjectFund.last)
  end

  test "should show project_fund" do
    get project_fund_url(@project_fund)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_fund_url(@project_fund)
    assert_response :success
  end

  test "should update project_fund" do
    patch project_fund_url(@project_fund), params: { project_fund: {  } }
    assert_redirected_to project_fund_url(@project_fund)
  end

  test "should destroy project_fund" do
    assert_difference('ProjectFund.count', -1) do
      delete project_fund_url(@project_fund)
    end

    assert_redirected_to project_funds_url
  end
end
