# This migration comes from the_trade_engine (originally 20170601014520)
class CreatePayments < ActiveRecord::Migration[5.1]
  def change

    create_table :payments do |t|
      t.column :type, :string, limit: 255
      t.column :total_amount, :decimal, precision: 10, scale: 2
      t.column :fee_amount, :decimal, precision: 10, scale: 2
      t.column :income_amount, :decimal, precision: 10, scale: 2
      t.column :checked_amount, :decimal, precision: 10, scale: 2
      t.column :adjust_amount, :decimal, precision: 10, scale: 2, default: 0
      t.column :payment_uuid, :string, limit: 255
      t.column :notify_type, :string, limit: 255
      t.column :notified_at, :datetime
      t.column :pay_status, :string, limit: 255
      t.column :sign, :string, limit: 255
      t.column :seller_identifier, :string, limit: 255
      t.column :buyer_name, :string, limit: 255
      t.column :buyer_identifier, :string, limit: 255
      t.column :buyer_bank, :string
      t.column :user_id, :integer, limit: 4
      t.column :currency, :string, limit: 255
      t.column :state, :integer, limit: 4, default: 0
      t.string :comment
      t.references :payment_method
      t.timestamps
    end

    create_table :payment_orders do |t|
      t.references :payment
      t.references :order
      t.decimal :order_amount, precision: 10, scale: 2
      t.decimal :check_amount, precision: 10, scale: 2
      t.integer :state, default: 0
      t.timestamps
    end

    create_table :payment_methods do |t|
      t.string :type
      t.string :account_name
      t.string :account_num
      t.string :bank
      t.text :extra
      t.boolean :verified
      t.timestamps
    end

  end
end
