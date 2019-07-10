class AddPresentToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :present, :boolean, default: false
    add_index :workers, [:user_id, :present]
  end
end
