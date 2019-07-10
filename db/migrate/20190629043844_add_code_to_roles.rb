class AddCodeToRoles < ActiveRecord::Migration[6.0]
  def change
    add_column :roles, :code, :string
    remove_column :roles, :who_type
    add_column :roles, :who_types, :string, array: true
  end
end
