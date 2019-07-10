class ChangeParentNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :tasks, :children, :child_ids
    rename_column :tasks, :parents, :parent_ids
  end
end
