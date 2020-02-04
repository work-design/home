class ChangeJsonTypeToJsonb < ActiveRecord::Migration[6.0]
  def change
    change_column :parts, :part_taxon_ancestors, :jsonb
    change_column :part_taxons, :parent_ancestors, :jsonb
  end
end
