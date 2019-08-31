class AddMaxSelectToPartTaxons < ActiveRecord::Migration[6.0]
  def change
    add_column :part_taxons, :max_select, :integer
    add_column :part_taxons, :min_select, :integer
  end
end
