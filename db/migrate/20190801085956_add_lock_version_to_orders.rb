class AddLockVersionToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :lock_version, :integer
  end
end
