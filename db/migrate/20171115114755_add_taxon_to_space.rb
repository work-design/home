class AddTaxonToSpace < ActiveRecord::Migration[5.2]
  def change
    add_reference :spaces, :space_taxon
  end
end
