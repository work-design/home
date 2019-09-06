class AddPriceToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :price, :decimal, precision: 10, scale: 2
  end
end
