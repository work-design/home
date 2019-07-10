# This migration comes from the_trade_engine (originally 20170602061859)
class CreatePaymentReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_references do |t|
      t.references :payment_method
      t.references :buyer
      t.timestamps
    end

    create_table :goods do |t|
      t.string :sku, index: true
      t.string :name
      t.decimal :quantity
      t.string :unit
      t.decimal :price
      t.integer :sales_count
      t.boolean :published, default: true
      t.references :promote
      t.timestamps
    end

    create_table :charges do |t|
      t.string :unit
      t.decimal :min, precision: 10, scale: 2
      t.decimal :max, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2
      t.string :type
      t.timestamps
    end
  end
end
