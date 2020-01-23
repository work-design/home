class RailsComMigration2 < ActiveRecord::Migration[6.0]

  def change












    add_reference :posts, :quip_app
    add_column :posts, :type, :string
    add_column :posts, :content, :string
    add_column :posts, :link, :string
    add_column :posts, :synced, :json, comment: "已同步至", default: {}
    add_column :posts, :sync_wechat, :boolean
    add_column :posts, :source_id, :string
    add_column :posts, :html, :string

























    add_reference :wechat_notices, :notification
    add_reference :wechat_notices, :wechat_user
    add_reference :wechat_notices, :wechat_subscribed
    add_column :wechat_notices, :link, :string, default: "index"
    remove_column :wechat_notices, :notifiable_type, :string
    remove_column :wechat_notices, :code, :string, default: "default"
    remove_column :wechat_notices, :mappings, :json, default: "{}"





    add_reference :wechat_templates, :template_config

    create_table :template_configs do |t|
      t.string :type
      t.string :title
      t.string :tid
      t.string :description
      t.string :notifiable_type
      t.string :code, default: "default"
      t.timestamps
    end





    create_table :template_key_words do |t|
      t.references :template_config
      t.integer :position
      t.integer :kid
      t.string :name
      t.string :example
      t.string :rule
      t.string :mapping
      t.string :color
      t.timestamps
    end

    remove_column :wechat_subscribeds, :wechat_notice_id, :integer, scale: 8






































































    add_column :quip_apps, :private_folder_id, :string
    add_column :quip_apps, :name, :string
    add_column :quip_apps, :profile_picture_url, :string





















































  end

end
