class AddBuyerIdToOrderPromotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_promotes, :promote_buyer
    add_reference :order_promotes, :promote_buyer
    add_column :promote_buyers, :order_promotes_count, :integer, default: 0
  end
end
