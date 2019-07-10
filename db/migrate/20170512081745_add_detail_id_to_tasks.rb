class AddDetailIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :detail
  end
end
