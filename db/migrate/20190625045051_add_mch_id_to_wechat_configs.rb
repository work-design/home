class AddMchIdToWechatConfigs < ActiveRecord::Migration[6.0]
  def change
    remove_columns :wechat_configs, :environment
    rename_column :wechat_configs, :account, :name
    add_column :wechat_configs, :mch_id, :string
    add_column :wechat_configs, :key, :string
    add_column :wechat_configs, :primary, :boolean

    remove_column :extractors, :wechat_config_id
    add_reference :extractors, :organ

    create_table :wechat_config_extractors do |t|
      t.references :extractor
      t.references :wechat_config
      t.timestamps
    end
    
    rename_table :wechat_feedbacks, :wechat_requests
    remove_columns :wechat_requests, :position, :feedback_on
    add_column :wechat_requests, :type, :string
    
    remove_columns :wechat_responses, :name, :start_at, :finish_at, :invalid_response, :valid_response
    rename_column :wechat_responses, :qrcode_expire_at, :expire_at
    
    create_table :tickets do |t|
      t.references :organ  # For SaaS
      t.string :match_value
      t.integer :serial_start
      t.time :start_at
      t.time :finish_at
      t.string :valid_response
      t.string :invalid_response
      t.timestamps
    end
    rename_table :response_items, :ticket_items
    rename_column :ticket_items, :wechat_response_id, :ticket_id
    rename_column :ticket_items, :wechat_feedback_id, :wechat_request_id
    remove_columns :ticket_items, :position, :respond_at, :respond_in, :respond_on
    add_column :ticket_items, :serial_number, :integer
    
  end
end
