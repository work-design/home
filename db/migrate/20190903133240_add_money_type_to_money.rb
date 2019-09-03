class AddMoneyTypeToMoney < ActiveRecord::Migration[6.0]
  def change
    remove_column :money_givens, :money_id
    add_reference :money_givens, :money, polymorphic: true
  end
end
