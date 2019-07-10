class FixRailsRoleMigration < ActiveRecord::Migration[6.0]
  def change
    rename_column :role_rules, :section_id, :govern_id
  end
end
