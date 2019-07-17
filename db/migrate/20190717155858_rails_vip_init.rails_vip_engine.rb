# This migration comes from rails_vip_engine (originally 20190103033525)
class RailsVipInit < ActiveRecord::Migration[5.2]
  def change

    create_table :wallets do |t|
      t.references :user
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.decimal :income_amount, precision: 10, scale: 2, default: 0
      t.decimal :expense_amount, precision: 10, scale: 2, default: 0
      t.integer :lock_version
      t.string :type
      t.boolean :active
      t.timestamps
    end

    create_table :advances do |t|
      t.decimal :price, precision: 10, scale: 2
      t.string :name
      t.string :description
      t.string :apple_product_id
      t.string :state
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end

    create_table :user_advances do |t|
      t.references :user
      t.references :wallet
      t.references :advance
      t.references :order_item
      t.decimal :price, precision: 10, scale: 2
      t.decimal :amount, precision: 10, scale: 2
      t.string :state
      t.timestamps
    end

    create_table :wallet_logs do |t|
      t.references :user
      t.references :wallet
      t.references :source, polymorphic: true
      t.string :title
      t.string :tag_str
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end

    create_table :cashes do |t|
      t.references :user
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.decimal :income_amount, precision: 10, scale: 2, default: 0
      t.decimal :expense_amount, precision: 10, scale: 2, default: 0
      t.integer :lock_version
      t.string :account_bank
      t.string :account_name
      t.string :account_num
      t.timestamps
    end

    create_table :money_givens do |t|
      t.string :type
      t.references :user
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.string :note
      t.timestamps
    end

    create_table :cash_logs do |t|
      t.references :cash
      t.references :user
      t.references :source, polymorphic: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :title
      t.string :tag_str
      t.timestamps
    end

    create_table :payouts do |t|
      t.string :type
      t.references :payable, polymorphic: true
      t.references :operator
      t.references :cash
      t.string :payout_uuid
      t.decimal :requested_amount, precision: 10, scale: 2
      t.decimal :actual_amount, precision: 10, scale: 2
      t.string :state
      t.datetime :paid_at
      t.boolean :advance, default: false
      t.string :account_bank
      t.string :account_name
      t.string :account_num
      t.timestamps
    end

    create_table :card_templates do |t|
      t.references :organ  # For SaaS
      t.string :name
      t.integer :valid_days
      t.integer :amount
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end

    create_table :cards do |t|
      t.references :organ
      t.references :card_template
      t.references :buyer, polymorphic: true
      t.references :trade_item
      t.references :tutelage
      t.references :client, polymorphic: true
      t.string :type
      t.string :card_uuid
      t.integer :amount
      t.integer :expense_amount
      t.integer :income_amount
      t.integer :lock_version
      t.datetime :effect_at
      t.datetime :expire_at
      t.timestamps
    end

    create_table :card_logs do |t|
      t.references :card
      t.references :source, polymorphic: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :title
      t.string :tag_str
      t.timestamps
    end

  end
end
