class AddFacilitateIdToTaskTemplates < ActiveRecord::Migration[5.2]

  def change
    add_reference :task_templates, :facilitate_provider
    remove_column :task_templates, :facilitate_id
    remove_columns :workers, :title, :grade, :join_on
  end


end
