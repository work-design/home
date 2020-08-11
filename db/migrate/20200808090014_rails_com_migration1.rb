class RailsComMigration1 < ActiveRecord::Migration[6.1]

  def change







    remove_column :organs, :auth_domain, :jsonb




    add_reference :notifications, :user
    remove_column :notifications, :receiver_type, :string
    remove_column :notifications, :receiver_id, :integer, scale: 4



    add_reference :wechat_registers, :user
    add_reference :wechat_registers, :organ
    add_column :wechat_registers, :email_code, :string
    add_column :wechat_registers, :password, :string
    add_column :wechat_registers, :mobile, :string
    add_column :wechat_registers, :mobile_code, :string
    add_column :wechat_registers, :record_name, :string, default: "WechatRegister"
    remove_column :wechat_registers, :member_id, :integer, scale: 8






































    add_column :wechat_notices, :type, :string
    add_column :wechat_notices, :appid, :string
    add_column :wechat_notices, :open_id, :string
    remove_column :wechat_notices, :wechat_app_id, :integer, scale: 8
    remove_column :wechat_notices, :wechat_user_id, :integer, scale: 8

    add_column :wechat_replies, :appid, :string, index: true
    remove_column :wechat_replies, :wechat_app_id, :integer, scale: 8
    remove_column :wechat_replies, :wechat_user_id, :integer, scale: 8


    create_table :wechat_platforms do |t|
      t.string :name
      t.string :appid
      t.string :secret
      t.string :token
      t.string :encoding_aes_key
      t.string :verify_ticket
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :pre_auth_code
      t.datetime :pre_auth_code_expires_at
      t.timestamps
    end

    add_reference :wechat_requests, :wechat_reply
    add_column :wechat_requests, :appid, :string, index: true
    add_column :wechat_requests, :open_id, :string, index: true
    add_column :wechat_requests, :reply_body, :json
    add_column :wechat_requests, :reply_encrypt, :string
    #remove_column :wechat_requests, :wechat_user_id, :integer, scale: 8
    #remove_column :wechat_requests, :wechat_app_id, :integer, scale: 8





    create_table :wechat_tickets do |t|
      t.string :signature
      t.integer :timestamp
      t.string :nonce
      t.string :msg_signature
      t.string :appid
      t.string :ticket_data
      t.timestamps
    end

    create_table :wechat_agencies do |t|
      t.references :wechat_platform
      t.string :appid
      t.string :access_token
      t.datetime :access_token_expires_at
      t.string :refresh_token
      t.string :func_infos, array: true
      t.string :nick_name
      t.string :head_img
      t.string :user_name
      t.string :principal_name
      t.string :alias_name
      t.string :qrcode_url
      t.json :business_info
      t.string :service_type
      t.string :verify_type
      t.timestamps
    end

    create_table :wechat_auths do |t|
      t.references :wechat_platform
      t.string :auth_code
      t.datetime :auth_code_expires_at
      t.timestamps
    end


    create_table :wechat_receiveds do |t|
      t.references :wechat_platform
      t.references :wechat_request
      t.string :appid, index: true
      t.string :open_id, index: true
      t.string :msg_id
      t.string :msg_type
      t.string :content
      t.string :encrypt_data
      t.json :message_hash
      t.timestamps
    end



    create_table :wechat_response_requests do |t|
      t.references :wechat_response
      t.string :request_type, comment: "用户发送消息类型"
      t.string :appid
      t.timestamps
    end

    add_column :wechat_apps, :oauth2_state, :string
    add_column :wechat_apps, :user_name, :string

    add_column :wechat_responses, :request_types, :string, array: true
    add_column :wechat_responses, :appid, :string, index: true
    #remove_column :wechat_responses, :wechat_app_id, :integer, scale: 8
    remove_column :wechat_responses, :request_type, :string, comment: "用户发送消息类型"





    remove_column :annunciates, :receiver_type, :string

    add_reference :notification_settings, :user
    remove_column :notification_settings, :receiver_type, :string
    remove_column :notification_settings, :receiver_id, :integer, scale: 4




























































    add_reference :task_templates, :organ
    add_reference :task_templates, :job_title
    add_reference :task_templates, :member
    add_column :task_templates, :parent_ancestors, :jsonb
    add_column :task_templates, :color, :string

    add_column :projects, :record_name, :string, default: "Project"




    drop_table :pipelines
    drop_table :pipeline_members



    add_reference :tasks, :job_title
    add_reference :tasks, :tasking, polymorphic: true
    add_reference :tasks, :task_template
    remove_column :tasks, :project_id, :integer, scale: 4
    remove_column :tasks, :detail_id, :integer, scale: 8
    remove_column :tasks, :pipeline_id, :integer, scale: 8




























































    add_column :acme_orders, :orderid, :string
    add_column :acme_orders, :url, :string
    remove_column :acme_orders, :identifier, :string
    remove_column :acme_orders, :file_name, :string
    remove_column :acme_orders, :file_content, :string
    remove_column :acme_orders, :record_name, :string
    remove_column :acme_orders, :record_content, :string
    remove_column :acme_orders, :domain, :string

    create_table :acme_identifiers do |t|
      t.references :acme_order
      t.string :identifier
      t.string :file_name
      t.string :file_content
      t.string :record_name
      t.string :record_content
      t.string :domain
      t.boolean :wildcard
      t.string :url
      t.timestamps
    end












    create_table :task_template_hierarchies do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false, index: {:name=>"task_template_desc_idx"}
      t.integer :generations, null: false
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
      t.index [:ancestor_id, :descendant_id, :generations], unique: true, name: "task_template_anc_desc_idx"
    end




    add_column :active_storage_blobs, :service_name, :string

    create_table :active_storage_variant_records do |t|
      t.references :blob
      t.string :variation_digest, null: false
      t.timestamps
    end



  end

end
