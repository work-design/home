class AddOrganToTaxons < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_taxons, :organ
    add_reference :products, :organ
    add_reference :part_taxons, :organ
    add_reference :parts, :organ
  end
end
