class AddPaymentStratoOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :payment_strategy
    add_column :orders, :myself, :boolean
    add_column :orders, :pure_serve_sum, :decimal, precision: 10, scale: 2
    add_column :orders, :pure_promote_sum, :decimal, precision: 10, scale: 2
    add_column :orders, :serve_sum, :decimal, precision: 10, scale: 2
    add_column :orders, :promote_sum, :decimal, precision: 10, scale: 2

    remove_columns :orders, :shipping_fee, :handling_fee
  end
end
