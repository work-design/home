class AddRefactorForWechat < ActiveRecord::Migration[6.0]
  def change
    create_table :organ_handles do |t|
      t.string :name
      t.string :description
      t.string :record_class
      t.string :record_column
      t.timestamps
    end
  
    create_table :department_grants do |t|
      t.references :organ
      t.references :organ_handle
      t.references :department
      t.references :job_title
      t.timestamps
    end

    rename_column :member_departments, :office_id, :organ_id
    rename_column :rooms, :office_id, :organ_id
    rename_column :supports, :office_id, :organ_id

    remove_column :organs, :limit_office
    remove_column :departments, :office_id
    drop_table :offices
    drop_table :office_hierarchies

    add_reference :organs, :area
    add_reference :organs, :parent
    add_column :organs, :address, :string
    add_column :organs, :locale, :string
    add_column :organs, :timezone, :string
    add_column :organs, :members_count, :integer

    create_table :organ_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: 'organ_anc_desc_idx'
      t.index [:descendant_id], name: 'organ_desc_idx'
    end

    remove_columns :members, :organ_token, :type
    add_reference :role_rules, :govern_taxon
    add_column :pipeline_members, :color, :string
    add_column :roles, :who_type, :string
    add_column :roles, :visible, :boolean
    add_reference :organs, :creator
    add_reference :members, :organ_root
    remove_column :member_departments, :organ_id
    add_column :profiles, :extra, :jsonb
    remove_columns :profiles, :type, :major, :degree
    rename_column :profiles, :mobile, :identity
    add_reference :profiles, :organ
    
    remove_columns :wechat_configs, :corpid, :corpsecret, :skip_verify_ssl, :timeout, :trusted_domain_fullname
    add_column :wechat_configs, :type, :string
    change_column :wechat_configs, :agentid, :string
    
  end
end
