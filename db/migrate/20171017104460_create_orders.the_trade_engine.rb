# This migration comes from the_trade_engine (originally 20170702234123)
class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :uuid, null: false
      t.integer :state, default: 0
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :received_amount, precision: 10, scale: 2
      t.decimal :subtotal, precision: 10, scale: 2
      t.decimal :shipping_fee, precision: 10, scale: 2
      t.decimal :handling_fee, precision: 10, scale: 2
      t.string :currency
      t.references :buyer
      t.integer :payment_id
      t.integer :payment_status
      t.timestamps
    end

    create_table :refunds do |t|
      t.references :order
      t.references :payment
      t.references :operator
      t.string :type
      t.decimal :total_amount, precision: 10, scale: 2
      t.string "buyer_identifier"
      t.string "comment", limit: 512
      t.integer "state", default: 0
      t.datetime "refunded_at"
      t.string "reason", limit: 512
      t.string "currency"
      t.string "refund_uuid"
      t.timestamps
    end

  end
end