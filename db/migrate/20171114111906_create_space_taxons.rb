class CreateSpaceTaxons < ActiveRecord::Migration[5.2]
  def change
    create_table :space_taxons do |t|
      t.string :name
      t.integer :position, default: 1
      t.integer :spaces_count, default: 0
      t.timestamps
    end
  end
end
