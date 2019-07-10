class RemoveProviderIdFromParts < ActiveRecord::Migration[5.2]
  def change
    drop_table :buyers
    drop_table :parts
    drop_table :products
    drop_table :goods

    rename_table :facilitates, :goods
    add_column :goods, :type, :string
    add_column :goods, :qr_prefix, :string

    add_column :goods, :quantity, :decimal
    add_column :goods, :unit, :string
    add_column :goods, :published, :boolean, default: true

    rename_column :goods, :facilitate_taxon_id, :good_taxon_id

    rename_table :facilitate_taxons, :good_taxons


  end
end
