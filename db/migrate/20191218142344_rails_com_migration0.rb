class RailsComMigration0 < ActiveRecord::Migration[6.0]

  def change


    add_column :trade_items, :good_name, :string
    add_column :trade_items, :weight, :decimal, comment: "重量", default: 0
    add_column :trade_items, :unit, :string, comment: "单位"
    add_column :trade_items, :note, :string
    add_column :trade_items, :advance_amount, :decimal, default: 0
    add_column :trade_items, :extra, :json, default: {}
    remove_column :trade_items, :quantity, :decimal, limit: 2, precision: 10
    remove_column :trade_items, :provider_id, :integer, scale: 8

    add_column :organs, :name_short, :string
    add_column :organs, :area_ancestors, :json
    add_column :organs, :limit_wechat_menu, :integer, default: 1
    add_column :organs, :parent_ancestors, :json

    add_reference :members, :provider
    add_column :members, :department_ancestors, :json
    add_column :members, :experience, :string
    add_column :members, :attendance_number, :string
    add_column :members, :owner, :boolean
    add_column :members, :cached_role_ids, :integer, array: true

    add_column :facilitates, :advance_price, :decimal, default: 0
    add_column :facilitates, :extra, :json, default: {}
    add_column :facilitates, :unified_quantity, :integer, default: 1
    add_column :facilitates, :buyer_type, :string
    add_column :facilitates, :buyer_id, :integer
    remove_column :facilitates, :type, :string


    create_table :facilitate_providers do |t|
      t.timestamps
    end


    add_column :orders, :note, :string, limit: 4096
    add_column :orders, :expire_at, :datetime
    add_column :orders, :extra, :json, default: {}

    add_column :profiles, :name, :string
    remove_column :profiles, :real_name, :string
    remove_column :profiles, :nick_name, :string
    remove_column :profiles, :note, :string
    remove_column :profiles, :extra, :jsonb

    add_column :agencies, :commission_ratio, :decimal, precision: 4, scale: 2, comment: "交易时抽成比例"
    add_column :agencies, :note, :string, comment: "备注"
    remove_column :agencies, :user_id, :integer, scale: 8

    add_column :posts, :title, :string
    remove_column :posts, :name, :string



    add_column :oauth_users, :state, :string
    add_column :oauth_users, :extra, :json, default: {}


    add_column :users, :cached_role_ids, :integer, array: true
    add_column :users, :invited_code, :string
    add_column :users, :provider_id, :integer

    add_column :areas, :parent_ancestors, :json




    add_column :parts, :part_taxon_ancestors, :json


    add_column :products, :cost_price, :decimal, precision: 10, scale: 2
    add_column :products, :product_taxon_ancestors, :json
    remove_column :products, :import_price, :decimal, limit: 2, precision: 10

    add_column :part_taxons, :parent_ancestors, :json
    add_column :part_taxons, :take_stock, :boolean, comment: "可盘点"

    add_column :product_taxons, :parent_ancestors, :json

    create_table :accessories do |t|
      t.timestamps
    end




    create_table :good_partners do |t|
      t.timestamps
    end

    add_column :customs, :name, :string
    add_column :customs, :sku, :string
    add_column :customs, :advance_price, :decimal, default: 0
    add_column :customs, :extra, :json, default: {}
    add_column :customs, :unit, :string
    add_column :customs, :quantity, :decimal, default: 0
    add_column :customs, :unified_quantity, :decimal, default: 0

    create_table :good_produces do |t|
      t.references :good
      t.references :produce
      t.timestamps
    end

    add_column :carts, :trade_items_count, :integer, default: 0
    add_column :carts, :retail_price, :decimal, comment: "商品汇总的原价", default: 0
    add_column :carts, :discount_price, :decimal, default: 0
    add_column :carts, :bulk_price, :decimal, default: 0
    add_column :carts, :reduced_amount, :decimal, comment: "汇总的减少价格", default: 0
    add_column :carts, :additional_amount, :decimal, default: 0
    add_column :carts, :total_quantity, :decimal, default: 0
    add_column :carts, :item_amount, :decimal, default: 0
    add_column :carts, :overall_additional_amount, :decimal, default: 0
    add_column :carts, :overall_reduced_amount, :decimal, default: 0

    create_table :produces do |t|
      t.timestamps
    end


    create_table :wechat_notices do |t|
      t.references :wechat_template
      t.references :wechat_app
      t.string :notifiable_type
      t.string :code, default: "default"
      t.json :mappings, default: {}
      t.timestamps
    end

    add_column :wechat_menus, :position, :integer

    create_table :wechat_messages do |t|
      t.references :wechat_app
      t.references :wechat_template
      t.references :messaging, polymorphic: true
      t.string :type
      t.string :value
      t.json :body
      t.timestamps
    end



    create_table :wechat_templates do |t|
      t.references :wechat_app
      t.string :template_id
      t.string :title
      t.string :content
      t.string :example
      t.integer :template_type
      t.timestamps
    end



    add_reference :wechat_tags, :tagging, polymorphic: true


    create_table :wechat_subscribeds do |t|
      t.references :wechat_user
      t.references :wechat_notice
      t.references :wechat_template
      t.datetime :sending_at
      t.string :status, default: "accept"
      t.timestamps
    end




    add_reference :wechat_user_tags, :user_tagged

    add_reference :notification_sendings, :notification



    add_reference :notifications, :organ
    add_reference :notifications, :sender, polymorphic: true
    add_reference :notifications, :linked, polymorphic: true

    add_column :annunciates, :notifications_count, :integer, default: 0

    add_column :notification_settings, :counters, :json, default: {}



    add_column :taxons, :parent_ancestors, :json



    add_reference :payments, :organ
    add_reference :payments, :creator
    add_column :payments, :verified, :boolean, default: true
    add_column :payments, :lock_version, :integer


    add_column :payment_references, :state, :string

    create_table :payment_types do |t|
      t.timestamps
    end

    add_column :promotes, :effect_at, :datetime
    add_column :promotes, :expire_at, :datetime
    remove_column :promotes, :start_at, :datetime
    remove_column :promotes, :finish_at, :datetime




    add_reference :payment_methods, :creator
    add_column :payment_methods, :myself, :boolean, default: true


    add_column :promote_buyers, :effect_at, :datetime
    add_column :promote_buyers, :expire_at, :datetime


    add_column :events, :event_participants_count, :integer, default: 0
    add_column :events, :members_count, :integer, default: 0
    remove_column :events, :event_members_count, :integer, scale: 4, default: "0"



    create_table :event_crowds do |t|
      t.references :event
      t.references :crowd
      t.integer :present_number, default: 0
      t.timestamps
    end

    add_reference :plan_attenders, :plan_participant
    add_reference :plan_attenders, :plan
    remove_column :plan_attenders, :plan_member_id, :integer, scale: 8

    add_column :time_lists, :kind, :string

    add_reference :plan_participants, :planning, polymorphic: true
    add_column :plan_participants, :type, :string
    add_column :plan_participants, :status, :string, comment: "默认 event_participant 有效"
    remove_column :plan_participants, :plan_id, :integer, scale: 8




    add_reference :event_participants, :event_crowd
    add_column :event_participants, :crowd_member_id, :integer

    add_reference :bookings, :seat

    create_table :seats do |t|
      t.references :place
      t.string :name
      t.timestamps
    end


    add_column :plans, :title, :string
    add_column :plans, :produced_begin_on, :date
    add_column :plans, :produced_end_on, :date
    add_column :plans, :produce_done, :boolean

    add_reference :places, :area
    add_column :places, :seats_count, :integer, default: 0
    add_column :places, :plans_count, :integer, default: 0
    remove_column :places, :max_members, :integer, scale: 4
    remove_column :places, :price, :decimal, limit: 2, precision: 10

    add_reference :plan_items, :time_list
    add_reference :plan_items, :planned, polymorphic: true
    add_reference :plan_items, :event
    add_reference :plan_items, :event_item
    add_column :plan_items, :plan_participants_count, :integer, default: 0
    remove_column :plan_items, :time_list_id_id, :integer, scale: 8


    remove_column :projects, :logo, :string


    create_table :schedules do |t|
      t.timestamps
    end

    create_table :task_contents do |t|
      t.references :task
      t.timestamps
    end

    add_column :project_funds, :name, :string
    add_column :project_funds, :sku, :string
    add_column :project_funds, :advance_price, :decimal, default: 0
    add_column :project_funds, :extra, :json, default: {}
    add_column :project_funds, :unit, :string
    add_column :project_funds, :quantity, :decimal, default: 0
    add_column :project_funds, :unified_quantity, :decimal, default: 0
    add_column :project_funds, :buyer_type, :string
    add_column :project_funds, :buyer_id, :integer



    add_reference :teams, :organ





    add_column :tasks, :parent_ancestors, :json

    create_table :audits do |t|
      t.references :audited, polymorphic: true
      t.references :operator, polymorphic: true
      t.string :action, default: "update"
      t.json :audited_changes, default: {}
      t.json :related_changes, default: {}
      t.json :extra, default: {}
      t.string :note, limit: 1024
      t.string :remote_ip
      t.string :controller_path
      t.string :action_name
      t.datetime :created_at, null: false, index: true
    end

    create_table :check_settings do |t|
      t.references :checking, polymorphic: true
      t.string :code
      t.timestamps
    end

    create_table :approvals do |t|
      t.references :approving, polymorphic: true
      t.references :operator, polymorphic: true
      t.string :state, default: "init"
      t.boolean :approved
      t.json :pending_changes, default: {}
      t.json :related_changes, default: {}
      t.string :comment
      t.datetime :approved_at
      t.integer :unapproved_approvals_count, default: 0
      t.timestamps
    end

    create_table :checks do |t|
      t.references :checking, polymorphic: true
      t.references :operator, polymorphic: true
      t.string :state
      t.string :comment
      t.boolean :confirmed, default: true
      t.timestamps
    end



    add_column :role_rules, :status, :string, default: "available"




    create_table :role_types do |t|
      t.references :role
      t.string :who_type
      t.timestamps
    end






    add_reference :cards, :agency
    remove_column :cards, :tutelage_id, :integer, scale: 8

    add_column :advances, :name, :string
    add_column :advances, :sku, :string
    add_column :advances, :advance_price, :decimal, default: 0
    add_column :advances, :extra, :json, default: {}
    add_column :advances, :unit, :string
    add_column :advances, :quantity, :decimal, default: 0
    add_column :advances, :unified_quantity, :decimal, default: 0
    remove_column :advances, :state, :string

    add_column :money_givens, :title, :string







    add_column :cashes, :account_number, :string
    remove_column :cashes, :account_num, :string


    add_reference :organ_grants, :session_organ
    add_column :organ_grants, :mock, :boolean

    create_table :resign_references do |t|
      t.references :resign
      t.references :resign_reason
      t.timestamps
    end

    create_table :resign_reasons do |t|
      t.string :name
      t.integer :position
      t.integer :resigns_count, default: 0
      t.timestamps
    end

    create_table :job_descriptions do |t|
      t.references :department
      t.text :requirements
      t.text :advanced_requirements
      t.string :english_requirement
      t.string :degree_requirement
      t.text :duties
      t.integer :salary_min
      t.integer :salary_max
      t.timestamps
    end

    add_reference :member_departments, :super_job_title



    add_reference :supports, :supporter
    add_column :supports, :department_ancestors, :json


    create_table :job_transfers do |t|
      t.references :member
      t.references :to_office
      t.references :to_department
      t.references :to_job_title
      t.references :from_office
      t.references :from_department
      t.references :from_job_title
      t.string :state, default: "init"
      t.date :transfer_on
      t.string :reason_note, limit: 4096
      t.timestamps
    end

    create_table :resigns do |t|
      t.references :member
      t.string :state, default: "init"
      t.date :leave_on
      t.string :reason_note, limit: 4096
      t.string :handover_note, limit: 4096
      t.string :comment, limit: 4096
      t.timestamps
    end








    add_column :maintain_logs, :tag_str, :string
    add_column :maintain_logs, :tag_sequence, :integer

    add_column :maintain_tags, :entity_column, :string
    add_column :maintain_tags, :entity_value, :string

    add_reference :maintains, :upstream
    add_reference :maintains, :source
    add_column :maintains, :position, :integer



    create_table :infos do |t|
      t.string :code
      t.string :value
      t.string :version
      t.string :platform
      t.timestamps
    end

    create_table :blob_defaults do |t|
      t.string :record_class, comment: "AR 类名，如 User"
      t.string :name, comment: "名称, attach 名称，如：avatar"
      t.boolean :private, comment: "是否私有"
      t.timestamps
    end

    create_table :cache_lists do |t|
      t.string :path
      t.string :key
      t.timestamps
    end

    add_column :organ_hierarchies, :created_at, :datetime, null: true
    add_column :organ_hierarchies, :updated_at, :datetime, null: true

    add_column :area_hierarchies, :created_at, :datetime, null: true
    add_column :area_hierarchies, :updated_at, :datetime, null: true

    add_column :part_taxon_hierarchies, :created_at, :datetime, null: true
    add_column :part_taxon_hierarchies, :updated_at, :datetime, null: true

    add_column :product_taxon_hierarchies, :created_at, :datetime, null: true
    add_column :product_taxon_hierarchies, :updated_at, :datetime, null: true

    add_column :taxon_hierarchies, :created_at, :datetime, null: true
    add_column :taxon_hierarchies, :updated_at, :datetime, null: true

    add_column :task_hierarchies, :created_at, :datetime, null: true
    add_column :task_hierarchies, :updated_at, :datetime, null: true

    add_column :department_hierarchies, :created_at, :datetime, null: true
    add_column :department_hierarchies, :updated_at, :datetime, null: true

    create_table :action_text_rich_texts do |t|
      t.string :name, null: false
      t.text :body, size: :long
      t.string :record_type, null: false
      t.integer :record_id, null: false
      t.timestamps
      t.index [:record_type, :record_id, :name], unique: true, name: "index_action_text_rich_texts_uniqueness"
    end

    create_table :action_mailbox_inbound_emails do |t|
      t.integer :status, default: 0, null: false
      t.string :message_id, null: false
      t.string :message_checksum, null: false
      t.timestamps
      t.index [:message_id, :message_checksum], unique: true, name: "index_action_mailbox_inbound_emails_uniqueness"
    end


  end

end
