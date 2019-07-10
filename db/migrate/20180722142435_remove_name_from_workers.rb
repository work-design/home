class RemoveNameFromWorkers < ActiveRecord::Migration[5.2]
  def change
    remove_column :workers, :name
    add_column :workers, :user_name, :string
  end
end
