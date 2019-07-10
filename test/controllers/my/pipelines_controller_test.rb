require 'test_helper'

class PipelinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pipeline = pipelines(:one)
  end

  test "should get index" do
    get pipelines_url
    assert_response :success
  end

  test "should get new" do
    get new_pipeline_url
    assert_response :success
  end

  test "should create pipeline" do
    assert_difference('Pipeline.count') do
      post pipelines_url, params: { pipeline: {  } }
    end

    assert_redirected_to pipeline_url(Pipeline.last)
  end

  test "should show pipeline" do
    get pipeline_url(@pipeline)
    assert_response :success
  end

  test "should get edit" do
    get edit_pipeline_url(@pipeline)
    assert_response :success
  end

  test "should update pipeline" do
    patch pipeline_url(@pipeline), params: { pipeline: {  } }
    assert_redirected_to pipeline_url(@pipeline)
  end

  test "should destroy pipeline" do
    assert_difference('Pipeline.count', -1) do
      delete pipeline_url(@pipeline)
    end

    assert_redirected_to pipelines_url
  end
end
