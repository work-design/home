class AddElastiToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :estimated_time, :integer
    add_column :tasks, :actual_time, :integer
  end
end
