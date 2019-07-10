class AddStartAtToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :start_at, :datetime
  end
end
