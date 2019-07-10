require 'test_helper'

class PipelineMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pipeline_member = pipeline_members(:one)
  end

  test "should get index" do
    get pipeline_members_url
    assert_response :success
  end

  test "should get new" do
    get new_pipeline_member_url
    assert_response :success
  end

  test "should create pipeline_member" do
    assert_difference('PipelineMember.count') do
      post pipeline_members_url, params: { pipeline_member: {  } }
    end

    assert_redirected_to pipeline_member_url(PipelineMember.last)
  end

  test "should show pipeline_member" do
    get pipeline_member_url(@pipeline_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_pipeline_member_url(@pipeline_member)
    assert_response :success
  end

  test "should update pipeline_member" do
    patch pipeline_member_url(@pipeline_member), params: { pipeline_member: {  } }
    assert_redirected_to pipeline_member_url(@pipeline_member)
  end

  test "should destroy pipeline_member" do
    assert_difference('PipelineMember.count', -1) do
      delete pipeline_member_url(@pipeline_member)
    end

    assert_redirected_to pipeline_members_url
  end
end
