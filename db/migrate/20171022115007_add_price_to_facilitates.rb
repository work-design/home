class AddPriceToFacilitates < ActiveRecord::Migration[5.2]
  def change
    add_column :facilitates, :price, :decimal, precision: 10, scale: 2
    add_column :facilitates, :sku, :string
  end
end
