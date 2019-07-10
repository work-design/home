class AddPartTaxonToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_parts, :part_taxon
  end
end
