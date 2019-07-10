class RenameCartItemsServes < ActiveRecord::Migration[5.2]
  def change
    rename_table :cart_item_serves, :cart_serves
    add_reference :cart_serves, :cart
    add_column :cart_serves, :original_price, :decimal, precision: 10, scale: 2
    remove_column :cart_serves, :scope
    create_table :cart_promotes do |t|
      t.references :cart
      t.references :cart_item
      t.references :promote
      t.decimal :price, precision: 10, scale: 2
      t.string :state
      t.timestamps
    end
  end
end
