class DropTableWhonRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :who_roles, force: true do |t|
      t.references :who, polymorphic: true
      t.references :role
      t.timestamps
    end
  end
end
