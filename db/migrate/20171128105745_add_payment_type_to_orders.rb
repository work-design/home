class AddPaymentTypeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_type, :string
  end
end
