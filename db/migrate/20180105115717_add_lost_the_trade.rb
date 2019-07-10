class AddLostTheTrade < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_item_serves do |t|
      t.references :cart_item
      t.references :serve
      t.string :scope
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
