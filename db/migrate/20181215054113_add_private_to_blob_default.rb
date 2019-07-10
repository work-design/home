class AddPrivateToBlobDefault < ActiveRecord::Migration[5.2]
  def change
    add_column :active_storage_blob_defaults, :private, :boolean
  end
end
