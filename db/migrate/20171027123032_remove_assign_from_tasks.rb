class RemoveAssignFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_columns :tasks, :assignable_type, :assignable_id

  end
end
