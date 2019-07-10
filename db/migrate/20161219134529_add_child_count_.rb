class AddChildCount < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :children_count, :integer, default: 0
  end
end
