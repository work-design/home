class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :cart_item
      t.references :good, polymorphic: true
      t.integer :quantity
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end