require "application_system_test_case"

class TaskTemplatesTest < ApplicationSystemTestCase
  setup do
    @task_template = task_templates(:one)
  end

  test "visiting the index" do
    visit task_templates_url
    assert_selector "h1", text: "Task Templates"
  end

  test "creating a Task template" do
    visit task_templates_url
    click_on "New Task Template"

    click_on "Create Task template"

    assert_text "Task template was successfully created"
    click_on "Back"
  end

  test "updating a Task template" do
    visit task_templates_url
    click_on "Edit", match: :first

    click_on "Update Task template"

    assert_text "Task template was successfully updated"
    click_on "Back"
  end

  test "destroying a Task template" do
    visit task_templates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Task template was successfully destroyed"
  end
end
