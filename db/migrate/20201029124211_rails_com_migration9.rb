class RailsComMigration9 < ActiveRecord::Migration[6.1]

  def change


























































































































    create_table :facilitate_indicators do |t|
      t.references :facilitate
      t.references :facilitate_taxon
      t.references :indicator
      t.string :note
      t.timestamps
    end

    create_table :project_taxon_indicators do |t|
      t.references :project_taxon
      t.references :facilitate_taxon
      t.references :indicator
      t.timestamps
    end


    add_column :project_indicators, :state, :string

    remove_column :facilitates, :import_price, :decimal, precision: 10
    remove_column :facilitates, :profit_price, :decimal, precision: 10

    add_reference :facilitate_taxons, :project_taxon
    add_column :facilitate_taxons, :color, :string
    add_column :facilitate_taxons, :description, :string
    add_column :facilitate_taxons, :indicators_count, :integer, default: 0


    add_reference :indicators, :project_taxon
    add_reference :indicators, :facilitate_taxon
    add_column :indicators, :target_source, :string
    remove_column :indicators, :indicator_taxon_id, :integer, scale: 8
    remove_column :indicators, :targt_source, :string

    drop_table :indicator_taxons
    create_table :project_taxon_facilitates do |t|
      t.references :project_taxon
      t.references :facilitate_taxon
      t.references :facilitate
      t.timestamps
    end












    remove_column :roles, :code, :string


    create_table :rule_operations do |t|
      t.string :action_identifier
      t.string :operation, default: "read"
      t.timestamps
    end

    create_table :busynesses do |t|
      t.string :identifier
      t.integer :position
      t.timestamps
    end

    add_column :role_rules, :controller_identifier, :string
    add_column :role_rules, :action_identifier, :string, index: true
    add_column :role_rules, :params_name, :string
    add_column :role_rules, :params_identifier, :string
    remove_column :role_rules, :rule_id, :integer, scale: 4
    remove_column :role_rules, :govern_taxon_id, :integer, scale: 8

    add_column :rules, :identifier, :string, index: true
    add_column :rules, :namespace_identifier, :string, default: "application"
    add_column :rules, :business_identifier, :string
    add_column :rules, :controller_identifier, :string, index: true
    add_column :rules, :action_name, :string
    add_column :rules, :operation, :string, default: "read"
    remove_column :rules, :name, :string
    remove_column :rules, :code, :string
    remove_column :rules, :govern_id, :integer, scale: 4
    remove_column :rules, :params, :string

    create_table :name_spaces do |t|
      t.string :name
      t.string :identifier, default: "application"
      t.boolean :verify_organ
      t.boolean :verify_member
      t.boolean :verify_user
      t.timestamps
    end

    add_column :governs, :identifier, :string, index: true
    add_column :governs, :namespace_identifier, :string, default: "application", index: true
    add_column :governs, :business_identifier, :string, index: true
    remove_column :governs, :name, :string
    remove_column :governs, :code, :string
    remove_column :governs, :govern_taxon_id, :integer, scale: 8
    remove_column :governs, :type, :string






























































  end

end
