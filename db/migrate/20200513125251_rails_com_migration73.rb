class RailsComMigration73 < ActiveRecord::Migration[6.0]

  def change


















































    add_reference :carts, :member
    remove_column :carts, :buyer_type, :string
    remove_column :carts, :buyer_id, :integer, scale: 8

































































    create_table :total_carts do |t|
      t.references :user
      t.decimal :retail_price, comment: "汇总：原价", default: 0
      t.decimal :discount_price, comment: "汇总：优惠", default: 0
      t.decimal :bulk_price, comment: "", default: 0
      t.decimal :total_quantity, default: 0
      t.integer :deposit_ratio, comment: "最小预付比例", default: 100
      t.decimal :item_amount, precision: 10, scale: 2, default: 0
      t.decimal :overall_additional_amount, precision: 10, scale: 2, default: 0
      t.decimal :overall_reduced_amount, precision: 10, scale: 2, default: 0
      t.decimal :total_additional_amount, default: 0
      t.decimal :total_reduced_amount, default: 0
      t.decimal :original_amount, comment: "原价，应用优惠之前的价格", default: 0
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.integer :trade_items_count, default: 0
      t.integer :lock_version
      t.timestamps
    end








































































































  end

end
