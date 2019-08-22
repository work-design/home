class ChangeCardAmountType < ActiveRecord::Migration[6.0]
  def change
    change_column :cards, :amount, :decimal, precision: 10, scale: 2
    change_column :cards, :expense_amount, :decimal, precision: 10, scale: 2
    change_column :cards, :income_amount, :decimal, precision: 10, scale: 2
  end
end
