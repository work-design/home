class AddProfitMarginToProductTaxon < ActiveRecord::Migration[5.2]
  def change
    add_column :product_taxons, :profit_margin, :decimal, precision: 4, scale: 2
  end
end
