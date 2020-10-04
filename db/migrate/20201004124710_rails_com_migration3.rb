class RailsComMigration3 < ActiveRecord::Migration[6.1]

  def change







    add_column :organs, :domain, :string
    remove_column :organs, :code, :string

    remove_column :members, :provider_id, :integer, scale: 8

    add_reference :notifications, :member



    add_column :profiles, :extra, :jsonb













    add_reference :financial_taxons, :organ
    remove_column :financial_taxons, :verifier_id, :integer, scale: 8



    add_reference :expenses, :organ
    add_reference :expenses, :expendable, polymorphic: true
    remove_column :expenses, :verifier_id, :integer, scale: 8























    add_column :wechat_menus, :mp_appid, :string
    add_column :wechat_menus, :mp_pagepath, :string
    remove_column :wechat_menus, :wechat_app_id, :integer, scale: 8
    remove_column :wechat_menus, :pagepath, :string























    add_reference :notification_settings, :member
    add_reference :notification_settings, :organ





























































    add_reference :projects, :organ
    add_reference :projects, :project_taxon
    add_reference :projects, :project_stage
    add_column :projects, :state, :string
    add_column :projects, :parameters, :jsonb
    add_column :projects, :budget, :decimal
    add_column :projects, :fund_amount, :decimal


    add_column :project_funds, :amount, :decimal
    add_column :project_funds, :note, :string

    create_table :project_taxons do |t|
      t.string :name
      t.string :record_name, default: "ProjectTaxon"
      t.jsonb :parameters, default: {}
      t.timestamps
    end


    remove_column :facilitates, :organ_id, :integer, scale: 8

    add_reference :facilitate_taxons, :parent
    add_column :facilitate_taxons, :parent_ancestors, :json
    remove_column :facilitate_taxons, :organ_id, :integer, scale: 8

    add_reference :facilitate_providers, :facilitate
    add_reference :facilitate_providers, :provider
    add_column :facilitate_providers, :selected, :boolean
    add_column :facilitate_providers, :note, :string
    add_column :facilitate_providers, :record_name, :string, default: "FacilitateProvider"

    add_column :project_members, :source, :string

    create_table :project_stages do |t|
      t.string :name
      t.date :begin_on
      t.date :end_on
      t.string :state
      t.timestamps
    end


    add_column :tasks, :note, :string


    create_table :verifiers do |t|
      t.references :verifiable, polymorphic: true
      t.references :member
      t.references :job_title
      t.string :name
      t.integer :position
      t.timestamps
    end


    create_table :verifications do |t|
      t.references :verified, polymorphic: true
      t.references :verifier
      t.references :member
      t.references :job_title
      t.string :state
      t.string :note
      t.integer :position
      t.boolean :confirmed
      t.timestamps
    end



















    remove_column :oauth_users, :remark, :string


    add_column :authorized_tokens, :mock_member, :boolean
    add_column :authorized_tokens, :mock_user, :boolean
    remove_column :authorized_tokens, :mock, :boolean































    add_reference :maintains, :task_template
    remove_column :maintains, :pipeline_member_id, :integer, scale: 8
    remove_column :maintains, :pipeline_id, :integer, scale: 8


















    create_table :facilitate_taxon_hierarchies do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false, index: {:name=>"facilitate_taxon_desc_idx"}
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "facilitate_taxon_anc_desc_idx"
    end








  end

end
