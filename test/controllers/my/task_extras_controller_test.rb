require 'test_helper'

class TaskExtrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_extra = task_extras(:one)
  end

  test "should get index" do
    get task_extras_url
    assert_response :success
  end

  test "should get new" do
    get new_task_extra_url
    assert_response :success
  end

  test "should create task_extra" do
    assert_difference('TaskExtra.count') do
      post task_extras_url, params: { task_extra: {  } }
    end

    assert_redirected_to task_extra_url(TaskExtra.last)
  end

  test "should show task_extra" do
    get task_extra_url(@task_extra)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_extra_url(@task_extra)
    assert_response :success
  end

  test "should update task_extra" do
    patch task_extra_url(@task_extra), params: { task_extra: {  } }
    assert_redirected_to task_extra_url(@task_extra)
  end

  test "should destroy task_extra" do
    assert_difference('TaskExtra.count', -1) do
      delete task_extra_url(@task_extra)
    end

    assert_redirected_to task_extras_url
  end
end
