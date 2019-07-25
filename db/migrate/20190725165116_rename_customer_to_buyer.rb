class RenameCustomerToBuyer < ActiveRecord::Migration[6.0]
  def change
    rename_column :customs, :customer_type, :buyer_type
    rename_column :customs, :customer_id, :buyer_id
  end
end
