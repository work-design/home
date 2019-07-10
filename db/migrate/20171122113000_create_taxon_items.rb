class CreateTaxonItems < ActiveRecord::Migration[5.2]
  def change
    create_table :taxon_items do |t|
      t.references :taxon, polymorphic: true
      t.references :list
      t.references :item
      t.timestamps
    end

    rename_table :space_items, :entity_items
    add_reference :entity_items, :entity, polymorphic: true
    remove_column :entity_items, :space_id
  end
end
