class RenameWechatConfigToWechatApps < ActiveRecord::Migration[6.0]
  def change
    rename_table :wechat_configs, :wechat_apps
    rename_table :wechat_config_extractors, :wechat_app_extractors
    drop_table :wechat_sessions
  
    rename_column :wechat_menus, :wechat_config_id, :wechat_app_id
    rename_column :wechat_requests, :wechat_config_id, :wechat_app_id
    rename_column :wechat_responses, :wechat_config_id, :wechat_app_id
    rename_column :wechat_app_extractors, :wechat_config_id, :wechat_app_id

    create_table :wechat_tag_defaults do |t|
      t.string :name
      t.string :default_type
      t.timestamps
    end

    create_table :wechat_tags do |t|
      t.references :wechat_app
      t.references :tagging, polymorphic: true
      t.string :name
      t.string :tag_id
      t.integer :count
      t.integer :wechat_user_tags_count
      t.timestamps
    end

    create_table :wechat_user_tags do |t|
      t.references :wechat_user
      t.references :wechat_tag
      t.timestamps
    end
  end
end
