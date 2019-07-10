class RemoveLogoFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :logo
    add_reference :entity_items, :taxon_item
  end
end
