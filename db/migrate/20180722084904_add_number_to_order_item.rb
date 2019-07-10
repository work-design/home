class AddNumberToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :number, :integer
    add_column :order_items, :pure_price, :decimal, precision: 10, scale: 2
    add_column :order_items, :serve_sum, :decimal, precision: 10, scale: 2
    add_column :order_items, :promote_sum, :decimal, precision: 10, scale: 2
  end
end
