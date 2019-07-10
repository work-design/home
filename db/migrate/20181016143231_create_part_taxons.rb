class CreatePartTaxons < ActiveRecord::Migration[5.2]
  def change
    create_table :part_taxons do |t|
      t.string :name
      t.integer :position, default: 1
      t.references :parent
      t.timestamps
    end
  end
end
