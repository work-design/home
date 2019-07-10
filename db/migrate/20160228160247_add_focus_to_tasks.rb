class AddFocusToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :focus, :integer
  end
end
