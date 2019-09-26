class RemovePriceToSpaces < ActiveRecord::Migration[6.0]
  def change
    drop_table :space_taxons
    drop_table :spaces
    
    add_reference :places, :place_taxon
    add_column :places, :description, :string
    add_column :places, :price, :decimal, precision: 10, scale: 2
  end
end
