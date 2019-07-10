class RenameSectionToGovern < ActiveRecord::Migration[5.2]
  def change
    rename_table :sections, :governs
    rename_table :section_taxons, :govern_taxons
    rename_column :governs, :section_taxon_id, :govern_taxon_id
    rename_column :govern_taxons, :sections_count, :governs_count
    rename_column :rules, :section_id, :govern_id
  end
end
