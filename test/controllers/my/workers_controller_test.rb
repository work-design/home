require 'test_helper'

class My::WorkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_worker = my_workers(:one)
  end

  test "should get index" do
    get my_workers_url
    assert_response :success
  end

  test "should get new" do
    get new_my_worker_url
    assert_response :success
  end

  test "should create my_worker" do
    assert_difference('My::Worker.count') do
      post my_workers_url, params: { my_worker: {  } }
    end

    assert_redirected_to my_worker_url(My::Worker.last)
  end

  test "should show my_worker" do
    get my_worker_url(@my_worker)
    assert_response :success
  end

  test "should get edit" do
    get edit_my_worker_url(@my_worker)
    assert_response :success
  end

  test "should update my_worker" do
    patch my_worker_url(@my_worker), params: { my_worker: {  } }
    assert_redirected_to my_worker_url(@my_worker)
  end

  test "should destroy my_worker" do
    assert_difference('My::Worker.count', -1) do
      delete my_worker_url(@my_worker)
    end

    assert_redirected_to my_workers_url
  end
end
