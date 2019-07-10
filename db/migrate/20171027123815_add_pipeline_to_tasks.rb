class AddPipelineToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :pipeline
    add_reference :tasks, :worker
  end
end
