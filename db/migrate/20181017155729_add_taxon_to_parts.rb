class AddTaxonToParts < ActiveRecord::Migration[5.2]
  def change
    add_reference :parts, :part_taxon
  end
end
