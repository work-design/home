class CreatePartTaxonHierarchies < ActiveRecord::Migration[5.2]
  def change
    create_table :part_taxon_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :part_taxon_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "part_taxon_anc_desc_idx"

    add_index :part_taxon_hierarchies, [:descendant_id],
      name: "part_taxon_desc_idx"
  end
end
