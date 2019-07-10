class CreateSectionTaxons < ActiveRecord::Migration[5.2]
  def change
    create_table :section_taxons do |t|
      t.string :name
      t.integer :position, default: 0
      t.integer :sections_count, default: 0
      t.timestamps
    end
    add_reference :sections, :section_taxon
    add_column :rules, :params, :string
  end
end
