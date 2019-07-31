class AddCardTemplateToAdvances < ActiveRecord::Migration[6.0]
  def change
    add_reference :advances, :card_template
    add_column :card_templates, :description, :string
    remove_columns :advances, :name, :description
    remove_columns :card_templates, :amount, :price
    rename_column :user_advances, :order_item_id, :trade_item_id
    rename_column :user_advances, :wallet_id, :card_id
  end
end
