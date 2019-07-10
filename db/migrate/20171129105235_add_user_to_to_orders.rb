class AddUserToToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :user
    add_reference :orders, :user
    add_column :cart_items, :assistant, :boolean, default: false
  end
end
