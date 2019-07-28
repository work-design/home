class UnifyAmountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :user
    add_reference :orders, :cart
    remove_columns :orders, :payment_type, :promote_sum, :serve_sum
    rename_column :orders, :pure_promote_sum, :overall_additional_amount
    rename_column :orders, :pure_serve_sum, :overall_reduced_amount
    rename_column :orders, :subtotal, :item_amount
    rename_column :trade_items, :additional_price, :additional_amount
    rename_column :trade_items, :reduced_price, :reduced_amount
    add_column :trade_items, :original_amount, :decimal, precision: 10, scale: 2
    add_column :trade_items, :retail_price, :decimal, precision: 10, scale: 2
    add_column :trade_items, :wholesale_price, :decimal, precision: 10, scale: 2
  end
end
