class AddTaskingToTaskTemplates < ActiveRecord::Migration[5.2]
  def change
    add_reference :task_templates, :tasking, polymorphic: true
    remove_columns :task_templates, :facilitate_provider_id
  end
end
