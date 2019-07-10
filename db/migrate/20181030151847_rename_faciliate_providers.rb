class RenameFaciliateProviders < ActiveRecord::Migration[5.2]
  def change
    rename_table :facilitate_providers, :good_providers
    remove_column :good_providers, :facilitate_id
    add_reference :good_providers, :good, polymorphic: true
  end
end
