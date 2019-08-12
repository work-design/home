class RenameProviderToOrgan < ActiveRecord::Migration[6.0]
  def change
    rename_column :spaces, :provider_id, :organ_id
  end
end
