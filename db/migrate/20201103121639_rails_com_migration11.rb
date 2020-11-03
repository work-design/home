class RailsComMigration11 < ActiveRecord::Migration[6.1]

  def change














































































































































    add_column :roles, :role_hash, :jsonb, default: {}




    remove_column :role_rules, :status, :string, default: "available"
    remove_column :role_rules, :action_identifier, :string
    remove_column :role_rules, :enabled, :boolean, default: "true"

































































  end

end
