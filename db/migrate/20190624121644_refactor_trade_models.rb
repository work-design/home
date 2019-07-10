class RefactorTradeModels < ActiveRecord::Migration[6.0]
  def change
    drop_table :serves
    drop_table :serve_charges
    drop_table :cart_items
    drop_table :order_serves
    drop_table :cart_serves
    
    remove_columns :promotes, :type, :overall_goods, :overall_buyers
    add_reference :promotes, :deal, polymorphic: true
    
    add_column :promote_charges, :contain_max, :boolean
    add_column :promote_charges, :contain_min, :boolean
    add_column :promote_charges, :base_price, :decimal, precision: 10, scale: 2
    add_column :promote_charges, :metering, :string
    add_column :promote_charges, :unit, :string
    
    rename_column :promote_buyers, :kind, :status
    rename_column :promote_buyers, :order_promotes_count, :trade_promotes_count
    rename_column :promote_goods, :kind, :status
    
    rename_table :order_promotes, :trade_promotes
    remove_columns :trade_promotes, :order_id, :order_item_id
    add_reference :trade_promotes, :trade, polymorphic: true
    add_reference :trade_promotes, :trade_item
    add_reference :trade_promotes, :promote_good
    add_column :trade_promotes, :scope, :string
    add_column :trade_promotes, :sequence, :integer
    add_column :trade_promotes, :based_amount, :decimal, precision: 10, scale: 2
    add_column :trade_promotes, :original_amount, :decimal, precision: 10, scale: 2
    
    rename_table :order_items, :trade_items
    remove_columns :trade_items, :order_id, :cart_item_id, :pure_price
    add_reference :trade_items, :trade, polymorphic: true
    rename_column :trade_items, :promote_sum, :additional_price
    rename_column :trade_items, :serve_sum, :reduced_price
    change_column :trade_items, :quantity, :decimal, precision: 10, scale: 2
    add_column :trade_items, :single_price, :decimal, precision: 10, scale: 2
    add_column :trade_items, :myself, :boolean
    add_column :trade_items, :starred, :boolean
    
    
  end
end
