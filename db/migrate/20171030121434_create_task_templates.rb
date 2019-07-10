class CreateTaskTemplates < ActiveRecord::Migration[5.2]
  def change

    create_table :task_templates do |t|
      t.string :title
      t.integer :parent_id
      t.integer :position, default: 1
      t.integer :pipeline_id
      t.references :facilitate
      t.timestamps
    end
    add_reference :pipelines, :facilitate_provider

  end
end
