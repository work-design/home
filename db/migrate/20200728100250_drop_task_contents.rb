class DropTaskContents < ActiveRecord::Migration[6.1]
  def change
    drop_table :task_contents
  end
end
