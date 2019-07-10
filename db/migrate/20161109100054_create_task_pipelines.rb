class CreateTaskPipelines < ActiveRecord::Migration[5.0]
  def change
    create_table :task_extras do |t|
      t.references :task
      t.references :pipeline
      t.timestamps
    end
  end
end
