class RenameNameForTasks < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :name, :title
  end
end
