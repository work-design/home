class AddCarts < ActiveRecord::Migration[6.0]
  def change
    add_reference :carts, :user
    add_reference :carts, :payment_strategy
    add_column :carts, :deposit_ratio, :integer
    add_column :carts, :default, :boolean
    add_reference :cart_items, :cart
    add_column :cart_items, :extra, :jsonb, default: {}
  end
end
