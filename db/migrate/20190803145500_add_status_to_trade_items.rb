class AddStatusToTradeItems < ActiveRecord::Migration[6.0]
  def change
    add_column :trade_items, :status, :string
  end
end
