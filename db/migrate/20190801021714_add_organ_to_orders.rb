class AddOrganToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :organ
  end
end
