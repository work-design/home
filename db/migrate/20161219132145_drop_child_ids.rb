class DropChildIds < ActiveRecord::Migration[5.0]
  def change
    remove_columns :tasks, :child_ids, :parent_ids
  end
end
