class RemoveWallets < ActiveRecord::Migration[6.0]
  def change
    drop_table :wallets
    drop_table :wallet_logs
    add_reference :money_givens, :money
    add_reference :money_givens, :organ
    remove_column :money_givens, :user_id
    
    rename_table :user_advances, :card_advances
    remove_column :card_advances, :user_id
  end
end
