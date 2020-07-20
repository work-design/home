class RailsComMigration4 < ActiveRecord::Migration[6.0]

  def change







    add_column :organs, :auth_domain, :jsonb
    remove_column :organs, :domain, :string






















































    add_column :wechat_registers, :state, :string, default: "init"
    add_column :wechat_registers, :appid, :string























    create_table :knowledges do |t|
      t.references :parent
      t.string :title
      t.text :body
      t.integer :position
      t.json :parent_ancestors
      t.timestamps
    end



    create_table :knowings do |t|
      t.references :knowable, polymorphic: true
      t.references :knowledge
      t.boolean :primary
      t.timestamps
    end




















































































































    create_table :acme_orders do |t|
      t.references :acme_account
      t.string :identifier
      t.string :file_name
      t.string :file_content
      t.string :record_name
      t.string :record_content
      t.string :domain
      t.timestamps
    end



    create_table :acme_accounts do |t|
      t.string :email
      t.string :kid
      t.timestamps
    end







    create_table :knowledge_hierarchies do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false, index: {:name=>"knowledge_desc_idx"}
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "knowledge_anc_desc_idx"
    end








  end

end
