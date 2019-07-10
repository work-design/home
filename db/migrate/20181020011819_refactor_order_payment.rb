class RefactorOrderPayment < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :payment_status
    add_column :orders, :payment_status, :string, index: true

    remove_columns :payment_orders, :state, :order_amount
    add_column :payment_orders, :state, :string, index: true

    remove_columns :payments, :state, :sign
    add_column :payments, :state, :string, index: true
  end
end
