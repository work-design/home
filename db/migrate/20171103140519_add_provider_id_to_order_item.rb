class AddProviderIdToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :provider
  end
end
