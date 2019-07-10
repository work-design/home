class DropTaskExtras < ActiveRecord::Migration[5.2]
  def change
    drop_table :task_extras
    drop_table :task_workers
  end
end
