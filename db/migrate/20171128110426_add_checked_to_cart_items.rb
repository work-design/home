class AddCheckedToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :checked, :boolean, default: false
  end
end
