class RemoveTypeFromCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :type, :string
  
    create_table :card_expenses do |t|
      t.references :card
      t.references :consumable, polymorphic: true
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  
    create_table :card_returns do |t|
      t.references :card
      t.references :consumable, polymorphic: true
      t.references :card_expense
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
