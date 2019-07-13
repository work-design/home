class RemoveManager < ActiveRecord::Migration[6.0]
  def change
    drop_table :managers
  end
end
