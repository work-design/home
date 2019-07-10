require 'test_helper'

class TaskTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_template = task_templates(:one)
  end

  test "should get index" do
    get task_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_task_template_url
    assert_response :success
  end

  test "should create task_template" do
    assert_difference('TaskTemplate.count') do
      post task_templates_url, params: { task_template: {  } }
    end

    assert_redirected_to task_template_url(TaskTemplate.last)
  end

  test "should show task_template" do
    get task_template_url(@task_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_template_url(@task_template)
    assert_response :success
  end

  test "should update task_template" do
    patch task_template_url(@task_template), params: { task_template: {  } }
    assert_redirected_to task_template_url(@task_template)
  end

  test "should destroy task_template" do
    assert_difference('TaskTemplate.count', -1) do
      delete task_template_url(@task_template)
    end

    assert_redirected_to task_templates_url
  end
end
