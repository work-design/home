class CreateFacilitateTaxon < ActiveRecord::Migration[5.1]
  def change
    create_table :facilitate_taxons do |t|
      t.string :name
      t.integer :position, default: 0
      t.integer :facilitates_count, default: 0
      t.timestamps
    end

    add_reference :facilitates, :facilitate_taxon
  end
end
