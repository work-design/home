class AddPostionToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :position, :integer, default: 1
  end
end
