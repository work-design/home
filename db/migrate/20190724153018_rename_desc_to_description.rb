class RenameDescToDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :desc, :description
    rename_column :parts, :desc, :description
    rename_column :items, :desc, :description
    rename_column :facilitates, :desc, :description
    rename_column :spaces, :desc, :description
  end
end
