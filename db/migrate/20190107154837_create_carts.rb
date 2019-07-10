class CreateCarts < ActiveRecord::Migration[5.2]
  def change

    create_table :carts do |t|
      t.references :buyer, polymorphic: true
      t.string :session_id, limit: 128
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end

    rename_column :cart_promotes, :price, :amount
    rename_column :cart_serves, :price, :amount
    rename_column :cart_serves, :original_price, :original_amount

    add_column :cart_items, :amount, :decimal, precision: 10, scale: 2
  end
end
