# This migration comes from rails_taxon_engine (originally 20160906083507)
class RailsTaxonInit < ActiveRecord::Migration[5.0]
  def change

    create_table :taxons do |t|
      t.string :name
      t.string :type
      t.string :color
      t.string :description
      t.integer :position, default: 1
      t.integer :entities_count, default: 0
      t.references :parent
      t.timestamps
    end

    create_table :taxon_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: 'taxon_anc_desc_idx'
      t.index [:descendant_id], name: 'taxon_desc_idx'
    end

    create_table :tags do |t|
      t.string :name
      t.string :type
      t.integer :taggeds_count, default: 0
      t.timestamps
    end

    create_table :taggeds do |t|
      t.references :tag
      t.references :tagging, polymorphic: true
      t.timestamps
    end

  end
end
