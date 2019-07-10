class RestoreProductons < ActiveRecord::Migration[5.2]
  def change
    rename_table :goods, :facilitates
    rename_table :good_taxons, :facilitate_taxons
    rename_column :facilitates, :good_taxon_id, :facilitate_taxon_id

    create_table :product_taxons do |t|
      t.string :name
      t.integer :position, default: 1
      t.references :parent
      t.timestamps
    end

    create_table :product_taxon_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end
    add_index :product_taxon_hierarchies, [:ancestor_id, :descendant_id, :generations], unique: true, name: 'product_taxon_anc_desc_idx'
    add_index :product_taxon_hierarchies, [:descendant_id], name: 'product_taxon_desc_idx'

    create_table :products do |t|
      t.references :product_taxon
      t.string :name
      t.string :desc
      t.string :qr_prefix
      t.string :sku, index: true
      t.string :type
      t.integer :order_items_count, default: 0
      t.boolean :published, default: true
      t.decimal :price, precision: 10, scale: 2
      t.decimal :import_price, precision: 10, scale: 2
      t.decimal :profit_price, precision: 10, scale: 2
      t.timestamps
    end

    create_table :parts do |t|
      t.references :part_taxon
      t.string :name
      t.string :desc
      t.string :qr_prefix
      t.string :sku, index: true
      t.string :type
      t.integer :order_items_count, default: 0
      t.boolean :published, default: true
      t.decimal :price, precision: 10, scale: 2
      t.decimal :import_price, precision: 10, scale: 2
      t.decimal :profit_price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
