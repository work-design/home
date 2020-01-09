# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_31_125902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "type"
    t.string "identity"
    t.boolean "confirmed", default: false
    t.boolean "primary", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", scale: 4, default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", scale: 4, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", scale: 8, null: false
    t.bigint "blob_id", scale: 8, null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blob_defaults", force: :cascade do |t|
    t.bigint "blob_id", scale: 8
    t.string "record_class"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private"
    t.index ["blob_id"], name: "index_active_storage_blob_defaults_on_blob_id"
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", scale: 8, null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "area_id", scale: 8
    t.string "addressing_type"
    t.bigint "addressing_id", scale: 8
    t.string "address"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressing_type", "addressing_id"], name: "index_addresses_on_addressing_type_and_addressing_id"
    t.index ["area_id"], name: "index_addresses_on_area_id"
  end

  create_table "advances", force: :cascade do |t|
    t.decimal "price", limit: 2, precision: 10
    t.string "apple_product_id"
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "card_template_id", scale: 8
    t.string "name"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.index ["card_template_id"], name: "index_advances_on_card_template_id"
  end

  create_table "agencies", force: :cascade do |t|
    t.string "relation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "client_type"
    t.bigint "client_id", scale: 8
    t.string "agent_type"
    t.bigint "agent_id", scale: 8
    t.decimal "commission_ratio", limit: 2, precision: 4, comment: "交易时抽成比例"
    t.string "note", comment: "备注"
    t.index ["agent_type", "agent_id"], name: "index_agencies_on_agent_type_and_agent_id"
    t.index ["client_type", "client_id"], name: "index_agencies_on_client_type_and_client_id"
  end

  create_table "annunciates", force: :cascade do |t|
    t.bigint "annunciation_id", scale: 8
    t.bigint "user_tag_id", scale: 8
    t.string "receiver_type"
    t.string "state"
    t.datetime "annunciated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "notifications_count", scale: 4, default: 0
    t.index ["annunciation_id"], name: "index_annunciates_on_annunciation_id"
    t.index ["user_tag_id"], name: "index_annunciates_on_user_tag_id"
  end

  create_table "annunciations", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "publisher_type"
    t.bigint "publisher_id", scale: 8
    t.string "title"
    t.string "body"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "notifications_count", scale: 4
    t.integer "readed_count", scale: 4
    t.index ["organ_id"], name: "index_annunciations_on_organ_id"
    t.index ["publisher_type", "publisher_id"], name: "index_annunciations_on_publisher_type_and_publisher_id"
  end

  create_table "approvals", force: :cascade do |t|
    t.string "approving_type"
    t.bigint "approving_id", scale: 8
    t.string "operator_type"
    t.bigint "operator_id", scale: 8
    t.string "state", default: "init"
    t.boolean "approved"
    t.json "pending_changes", default: {}
    t.json "related_changes", default: {}
    t.string "comment"
    t.datetime "approved_at"
    t.integer "unapproved_approvals_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["approving_type", "approving_id"], name: "index_approvals_on_approving_type_and_approving_id"
    t.index ["operator_type", "operator_id"], name: "index_approvals_on_operator_type_and_operator_id"
  end

  create_table "area_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "area_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "area_desc_idx"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.string "names", array: true
    t.bigint "parent_id", scale: 8
    t.boolean "published", default: true
    t.boolean "popular", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "parent_ancestors"
    t.index ["parent_id"], name: "index_areas_on_parent_id"
  end

  create_table "audits", force: :cascade do |t|
    t.string "audited_type"
    t.bigint "audited_id", scale: 8
    t.string "operator_type"
    t.bigint "operator_id", scale: 8
    t.string "action", default: "update"
    t.json "audited_changes", default: {}
    t.json "related_changes", default: {}
    t.json "extra", default: {}
    t.string "note", scale: 1024
    t.string "remote_ip"
    t.string "controller_path"
    t.string "action_name"
    t.datetime "created_at", null: false
    t.index ["audited_type", "audited_id"], name: "index_audits_on_audited_type_and_audited_id"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["operator_type", "operator_id"], name: "index_audits_on_operator_type_and_operator_id"
  end

  create_table "authorized_tokens", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "oauth_user_id", scale: 8
    t.bigint "account_id", scale: 8
    t.string "token"
    t.datetime "expire_at"
    t.string "session_key"
    t.integer "access_counter", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_authorized_tokens_on_account_id"
    t.index ["oauth_user_id"], name: "index_authorized_tokens_on_oauth_user_id"
    t.index ["user_id", "oauth_user_id", "account_id", "token"], name: "index_authorized_tokens_on_unique_token", unique: true
    t.index ["user_id"], name: "index_authorized_tokens_on_user_id"
  end

  create_table "blob_defaults", force: :cascade do |t|
    t.string "record_class", comment: "AR 类名，如 User"
    t.string "name", comment: "名称, attach 名称，如：avatar"
    t.boolean "private", comment: "是否私有"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", id: :serial, scale: 4, force: :cascade do |t|
    t.string "booker_type"
    t.integer "booker_id", scale: 4
    t.string "booked_type"
    t.integer "booked_id", scale: 4
    t.integer "plan_item_id", scale: 4
    t.integer "time_item_id", scale: 4
    t.integer "place_id", scale: 4
    t.date "booking_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "seat_id", scale: 8
    t.index ["booked_type", "booked_id"], name: "index_bookings_on_booked_type_and_booked_id"
    t.index ["booker_type", "booker_id"], name: "index_bookings_on_booker_type_and_booker_id"
    t.index ["place_id"], name: "index_bookings_on_place_id"
    t.index ["plan_item_id"], name: "index_bookings_on_plan_item_id"
    t.index ["seat_id"], name: "index_bookings_on_seat_id"
    t.index ["time_item_id"], name: "index_bookings_on_time_item_id"
  end

  create_table "cache_lists", force: :cascade do |t|
    t.string "path"
    t.string "key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "card_advances", force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.bigint "advance_id", scale: 8
    t.bigint "trade_item_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.decimal "amount", limit: 2, precision: 10
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advance_id"], name: "index_card_advances_on_advance_id"
    t.index ["card_id"], name: "index_card_advances_on_card_id"
    t.index ["trade_item_id"], name: "index_card_advances_on_trade_item_id"
  end

  create_table "card_expenses", force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.string "consumable_type"
    t.bigint "consumable_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_expenses_on_card_id"
    t.index ["consumable_type", "consumable_id"], name: "index_card_expenses_on_consumable_type_and_consumable_id"
  end

  create_table "card_logs", force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.string "title"
    t.string "tag_str"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_logs_on_card_id"
    t.index ["source_type", "source_id"], name: "index_card_logs_on_source_type_and_source_id"
  end

  create_table "card_returns", force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.string "consumable_type"
    t.bigint "consumable_id", scale: 8
    t.bigint "card_expense_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_expense_id"], name: "index_card_returns_on_card_expense_id"
    t.index ["card_id"], name: "index_card_returns_on_card_id"
    t.index ["consumable_type", "consumable_id"], name: "index_card_returns_on_consumable_type_and_consumable_id"
  end

  create_table "card_templates", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.integer "valid_days", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["organ_id"], name: "index_card_templates_on_organ_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "card_template_id", scale: 8
    t.bigint "trade_item_id", scale: 8
    t.string "client_type"
    t.bigint "client_id", scale: 8
    t.string "card_uuid"
    t.decimal "amount", limit: 2, precision: 10
    t.decimal "expense_amount", limit: 2, precision: 10
    t.decimal "income_amount", limit: 2, precision: 10
    t.integer "lock_version", scale: 4
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "buyer_type"
    t.bigint "buyer_id", scale: 8
    t.bigint "agency_id", scale: 8
    t.index ["agency_id"], name: "index_cards_on_agency_id"
    t.index ["buyer_type", "buyer_id"], name: "index_cards_on_buyer_type_and_buyer_id"
    t.index ["card_template_id"], name: "index_cards_on_card_template_id"
    t.index ["client_type", "client_id"], name: "index_cards_on_client_type_and_client_id"
    t.index ["organ_id"], name: "index_cards_on_organ_id"
    t.index ["trade_item_id"], name: "index_cards_on_trade_item_id"
  end

  create_table "cart_promotes", force: :cascade do |t|
    t.bigint "cart_id", scale: 8
    t.bigint "cart_item_id", scale: 8
    t.bigint "promote_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promote_charge_id", scale: 8
    t.bigint "promote_buyer_id", scale: 8
    t.index ["cart_id"], name: "index_cart_promotes_on_cart_id"
    t.index ["cart_item_id"], name: "index_cart_promotes_on_cart_item_id"
    t.index ["promote_buyer_id"], name: "index_cart_promotes_on_promote_buyer_id"
    t.index ["promote_charge_id"], name: "index_cart_promotes_on_promote_charge_id"
    t.index ["promote_id"], name: "index_cart_promotes_on_promote_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "buyer_type"
    t.bigint "buyer_id", scale: 8
    t.string "session_id", scale: 128
    t.decimal "amount", limit: 2, precision: 10
    t.bigint "user_id", scale: 8
    t.bigint "payment_strategy_id", scale: 8
    t.integer "deposit_ratio", scale: 4
    t.boolean "default"
    t.bigint "organ_id", scale: 8
    t.integer "trade_items_count", scale: 4, default: 0
    t.decimal "retail_price", default: "0.0", comment: "商品汇总的原价"
    t.decimal "discount_price", default: "0.0"
    t.decimal "bulk_price", default: "0.0"
    t.decimal "reduced_amount", default: "0.0", comment: "汇总的减少价格"
    t.decimal "additional_amount", default: "0.0"
    t.decimal "total_quantity", default: "0.0"
    t.decimal "item_amount", default: "0.0"
    t.decimal "overall_additional_amount", default: "0.0"
    t.decimal "overall_reduced_amount", default: "0.0"
    t.index ["buyer_type", "buyer_id"], name: "index_carts_on_buyer_type_and_buyer_id"
    t.index ["organ_id"], name: "index_carts_on_organ_id"
    t.index ["payment_strategy_id"], name: "index_carts_on_payment_strategy_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cash_logs", force: :cascade do |t|
    t.bigint "cash_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.string "title"
    t.string "tag_str"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cash_id"], name: "index_cash_logs_on_cash_id"
    t.index ["source_type", "source_id"], name: "index_cash_logs_on_source_type_and_source_id"
    t.index ["user_id"], name: "index_cash_logs_on_user_id"
  end

  create_table "cashes", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.decimal "income_amount", limit: 2, precision: 10, default: "0.0"
    t.decimal "expense_amount", limit: 2, precision: 10, default: "0.0"
    t.integer "lock_version", scale: 4
    t.string "account_bank"
    t.string "account_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_number"
    t.index ["user_id"], name: "index_cashes_on_user_id"
  end

  create_table "charges", force: :cascade do |t|
    t.string "unit"
    t.decimal "min", limit: 2, precision: 10
    t.decimal "max", limit: 2, precision: 10
    t.decimal "price", limit: 2, precision: 10
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_settings", force: :cascade do |t|
    t.string "checking_type"
    t.bigint "checking_id", scale: 8
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checking_type", "checking_id"], name: "index_check_settings_on_checking_type_and_checking_id"
  end

  create_table "checks", force: :cascade do |t|
    t.string "checking_type"
    t.bigint "checking_id", scale: 8
    t.string "operator_type"
    t.bigint "operator_id", scale: 8
    t.string "state"
    t.string "comment"
    t.boolean "confirmed", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checking_type", "checking_id"], name: "index_checks_on_checking_type_and_checking_id"
    t.index ["operator_type", "operator_id"], name: "index_checks_on_operator_type_and_operator_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.text "body"
    t.integer "position", scale: 4, default: 0
    t.string "list", scale: 50
    t.bigint "detail_id", scale: 8
    t.bigint "author_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "detail_type"
    t.index ["author_id"], name: "index_contents_on_author_id"
    t.index ["detail_id"], name: "index_contents_on_detail_id"
  end

  create_table "crowd_members", force: :cascade do |t|
    t.bigint "crowd_id", scale: 8
    t.string "member_type"
    t.bigint "member_id", scale: 8
    t.bigint "agency_id", scale: 8
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agency_id"], name: "index_crowd_members_on_agency_id"
    t.index ["crowd_id"], name: "index_crowd_members_on_crowd_id"
    t.index ["member_type", "member_id"], name: "index_crowd_members_on_member_type_and_member_id"
  end

  create_table "crowds", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "member_type"
    t.integer "crowd_members_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_crowds_on_organ_id"
  end

  create_table "custom_parts", force: :cascade do |t|
    t.bigint "custom_id", scale: 8
    t.bigint "part_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "original_price", limit: 2, precision: 10
    t.decimal "price", limit: 2, precision: 10
    t.index ["custom_id"], name: "index_custom_parts_on_custom_id"
    t.index ["part_id"], name: "index_custom_parts_on_part_id"
  end

  create_table "customs", force: :cascade do |t|
    t.string "state"
    t.string "qr_code"
    t.datetime "ordered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", scale: 8
    t.string "buyer_type"
    t.bigint "buyer_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.bigint "organ_id", scale: 8
    t.bigint "cart_id", scale: 8
    t.string "name"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.index ["buyer_type", "buyer_id"], name: "index_customs_on_buyer_type_and_buyer_id"
    t.index ["cart_id"], name: "index_customs_on_cart_id"
    t.index ["organ_id"], name: "index_customs_on_organ_id"
    t.index ["product_id"], name: "index_customs_on_product_id"
  end

  create_table "data_lists", id: :serial, scale: 4, force: :cascade do |t|
    t.string "title"
    t.string "comment", scale: 4096
    t.string "type"
    t.string "data_table"
    t.string "export_excel"
    t.string "export_pdf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "parameters"
    t.jsonb "columns"
  end

  create_table "department_grants", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "organ_handle_id", scale: 8
    t.bigint "department_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_department_grants_on_department_id"
    t.index ["job_title_id"], name: "index_department_grants_on_job_title_id"
    t.index ["organ_handle_id"], name: "index_department_grants_on_organ_handle_id"
    t.index ["organ_id"], name: "index_department_grants_on_organ_id"
  end

  create_table "department_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "department_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "department_desc_idx"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "name"
    t.integer "member_departments_count", scale: 4, default: 0
    t.integer "needed_number", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "all_member_departments_count", scale: 4
    t.bigint "superior_id", scale: 8
    t.jsonb "superior_ancestors"
    t.jsonb "parent_ancestors"
    t.index ["organ_id"], name: "index_departments_on_organ_id"
    t.index ["parent_id"], name: "index_departments_on_parent_id"
    t.index ["superior_id"], name: "index_departments_on_superior_id"
  end

  create_table "details", force: :cascade do |t|
    t.string "name"
    t.integer "contents_count", scale: 4, default: 0
    t.integer "pictures_count", scale: 4, default: 0
    t.integer "links_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_items", force: :cascade do |t|
    t.bigint "list_id", scale: 8
    t.bigint "item_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.bigint "taxon_item_id", scale: 8
    t.index ["entity_type", "entity_id"], name: "index_entity_items_on_entity_type_and_entity_id"
    t.index ["item_id"], name: "index_entity_items_on_item_id"
    t.index ["list_id"], name: "index_entity_items_on_list_id"
    t.index ["taxon_item_id"], name: "index_entity_items_on_taxon_item_id"
  end

  create_table "event_crowds", force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.bigint "crowd_id", scale: 8
    t.integer "present_number", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["crowd_id"], name: "index_event_crowds_on_crowd_id"
    t.index ["event_id"], name: "index_event_crowds_on_event_id"
  end

  create_table "event_grants", force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "grant_kind"
    t.string "grant_column"
    t.jsonb "filter", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_grants_on_event_id"
  end

  create_table "event_items", force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "name"
    t.bigint "author_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_event_items_on_author_id"
    t.index ["event_id"], name: "index_event_items_on_event_id"
  end

  create_table "event_participants", force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "participant_type"
    t.bigint "participant_id", scale: 8
    t.string "state"
    t.integer "score", scale: 4
    t.string "comment", scale: 4096
    t.string "quit_note"
    t.string "assigned_status"
    t.string "job_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_crowd_id", scale: 8
    t.integer "crowd_member_id", scale: 4
    t.index ["event_crowd_id"], name: "index_event_participants_on_event_crowd_id"
    t.index ["event_id"], name: "index_event_participants_on_event_id"
    t.index ["participant_type", "participant_id"], name: "index_event_participants_on_participant_type_and_participant_id"
  end

  create_table "event_taxons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_event_taxons_on_organ_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "event_taxon_id", scale: 8
    t.string "type"
    t.string "name"
    t.string "description", scale: 4096
    t.integer "position", scale: 4
    t.integer "event_items_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organ_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.integer "event_participants_count", scale: 4, default: 0
    t.integer "members_count", scale: 4, default: 0
    t.index ["event_taxon_id"], name: "index_events_on_event_taxon_id"
    t.index ["organ_id"], name: "index_events_on_organ_id"
  end

  create_table "extractions", force: :cascade do |t|
    t.bigint "extractor_id", scale: 8
    t.string "extractable_type"
    t.bigint "extractable_id", scale: 8
    t.string "name"
    t.string "matched"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["extractable_type", "extractable_id"], name: "index_extractions_on_extractable_type_and_extractable_id"
    t.index ["extractor_id"], name: "index_extractions_on_extractor_id"
  end

  create_table "extractors", force: :cascade do |t|
    t.string "name"
    t.string "prefix"
    t.string "suffix"
    t.boolean "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_extractors_on_organ_id"
  end

  create_table "facilitate_providers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilitate_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 0
    t.integer "facilitates_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilitates", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "facilitate_taxon_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.string "sku"
    t.decimal "import_price", limit: 2, precision: 10
    t.decimal "profit_price", limit: 2, precision: 10
    t.string "qr_prefix"
    t.decimal "quantity"
    t.string "unit"
    t.boolean "published", default: true
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.integer "unified_quantity", scale: 4, default: 1
    t.string "buyer_type"
    t.integer "buyer_id", scale: 4
    t.index ["facilitate_taxon_id"], name: "index_facilitates_on_facilitate_taxon_id"
  end

  create_table "good_partners", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "good_produces", force: :cascade do |t|
    t.bigint "good_id", scale: 8
    t.bigint "produce_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["good_id"], name: "index_good_produces_on_good_id"
    t.index ["produce_id"], name: "index_good_produces_on_produce_id"
  end

  create_table "good_providers", force: :cascade do |t|
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "export_price", limit: 2, precision: 10
    t.boolean "verified", default: false
    t.boolean "selected"
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.index ["good_type", "good_id"], name: "index_good_providers_on_good_type_and_good_id"
    t.index ["provider_id"], name: "index_good_providers_on_provider_id"
  end

  create_table "govern_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 0
    t.integer "governs_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "governs", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "position", scale: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "govern_taxon_id", scale: 8
    t.string "type"
    t.index ["govern_taxon_id"], name: "index_governs_on_govern_taxon_id"
  end

  create_table "infos", force: :cascade do |t|
    t.string "code"
    t.string "value"
    t.string "version"
    t.string "platform"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "key"
    t.string "description", scale: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "list_id", scale: 8
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "job_descriptions", force: :cascade do |t|
    t.bigint "department_id", scale: 8
    t.text "requirements"
    t.text "advanced_requirements"
    t.string "english_requirement"
    t.string "degree_requirement"
    t.text "duties"
    t.integer "salary_min", scale: 4
    t.integer "salary_max", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_job_descriptions_on_department_id"
  end

  create_table "job_title_references", force: :cascade do |t|
    t.bigint "super_job_title_id", scale: 8
    t.bigint "department_root_id", scale: 8
    t.bigint "department_id", scale: 8
    t.integer "grade", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_job_title_references_on_department_id"
    t.index ["department_root_id"], name: "index_job_title_references_on_department_root_id"
    t.index ["super_job_title_id"], name: "index_job_title_references_on_super_job_title_id"
  end

  create_table "job_titles", force: :cascade do |t|
    t.bigint "department_id", scale: 8
    t.bigint "department_root_id", scale: 8
    t.string "name"
    t.integer "grade", scale: 4
    t.integer "limit_member", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.integer "cached_role_ids", scale: 4, array: true
    t.index ["department_id"], name: "index_job_titles_on_department_id"
    t.index ["department_root_id"], name: "index_job_titles_on_department_root_id"
  end

  create_table "job_transfers", force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "to_office_id", scale: 8
    t.bigint "to_department_id", scale: 8
    t.bigint "to_job_title_id", scale: 8
    t.bigint "from_office_id", scale: 8
    t.bigint "from_department_id", scale: 8
    t.bigint "from_job_title_id", scale: 8
    t.string "state", default: "init"
    t.date "transfer_on"
    t.string "reason_note", scale: 4096
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_department_id"], name: "index_job_transfers_on_from_department_id"
    t.index ["from_job_title_id"], name: "index_job_transfers_on_from_job_title_id"
    t.index ["from_office_id"], name: "index_job_transfers_on_from_office_id"
    t.index ["member_id"], name: "index_job_transfers_on_member_id"
    t.index ["to_department_id"], name: "index_job_transfers_on_to_department_id"
    t.index ["to_job_title_id"], name: "index_job_transfers_on_to_job_title_id"
    t.index ["to_office_id"], name: "index_job_transfers_on_to_office_id"
  end

  create_table "links", id: :serial, scale: 4, force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "content_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_links_on_content_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4
    t.integer "items_count", scale: 4, default: 0
    t.integer "status", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "log_csps", force: :cascade do |t|
    t.string "document_uri"
    t.string "referrer"
    t.string "violated_directive"
    t.string "effective_directive"
    t.string "original_policy", scale: 1024
    t.string "disposition"
    t.string "blocked_uri"
    t.string "line_number"
    t.string "column_number"
    t.string "source_file"
    t.string "status_code"
    t.string "script_sample"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "log_mailers", force: :cascade do |t|
    t.string "message_object_id"
    t.string "mailer"
    t.string "action_name"
    t.string "params"
    t.string "subject"
    t.string "mail_to"
    t.string "cc_to"
    t.string "sent_status"
    t.string "sent_string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "log_records", id: :serial, scale: 4, force: :cascade do |t|
    t.string "path"
    t.string "controller_name"
    t.string "action_name"
    t.string "params"
    t.string "headers", scale: 4096
    t.string "cookie", scale: 2048
    t.string "session", scale: 2048
    t.string "exception", scale: 10240
    t.string "exception_object"
    t.text "exception_backtrace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "task_id", scale: 4
    t.datetime "started_at"
    t.datetime "stopped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_logs_on_task_id"
  end

  create_table "maintain_logs", force: :cascade do |t|
    t.bigint "maintain_id", scale: 8
    t.bigint "member_id", scale: 8
    t.string "logged_type"
    t.bigint "logged_id", scale: 8
    t.bigint "maintain_tag_id", scale: 8
    t.string "note"
    t.jsonb "extra", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tag_str"
    t.integer "tag_sequence", scale: 4
    t.index ["logged_type", "logged_id"], name: "index_maintain_logs_on_logged_type_and_logged_id"
    t.index ["maintain_id"], name: "index_maintain_logs_on_maintain_id"
    t.index ["maintain_tag_id"], name: "index_maintain_logs_on_maintain_tag_id"
    t.index ["member_id"], name: "index_maintain_logs_on_member_id"
  end

  create_table "maintain_source_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintain_sources", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "maintain_source_template_id", scale: 8
    t.string "name"
    t.integer "maintains_count", scale: 4, default: 0
    t.index ["maintain_source_template_id"], name: "index_maintain_sources_on_maintain_source_template_id"
    t.index ["organ_id"], name: "index_maintain_sources_on_organ_id"
  end

  create_table "maintain_tag_templates", force: :cascade do |t|
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.integer "sequence", scale: 4
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintain_tags", force: :cascade do |t|
    t.bigint "maintain_tag_template_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.boolean "manual"
    t.integer "sequence", scale: 4
    t.integer "maintain_logs_count", scale: 4, default: 0
    t.string "color"
    t.string "logged_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "entity_column"
    t.string "entity_value"
    t.index ["maintain_tag_template_id"], name: "index_maintain_tags_on_maintain_tag_template_id"
    t.index ["organ_id"], name: "index_maintain_tags_on_organ_id"
  end

  create_table "maintains", force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.string "client_type"
    t.bigint "client_id", scale: 8
    t.string "agent_type"
    t.bigint "agent_id", scale: 8
    t.bigint "agency_id", scale: 8
    t.bigint "maintain_source_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "pipeline_member_id", scale: 8
    t.bigint "pipeline_id", scale: 8
    t.string "state"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "upstream_id", scale: 8
    t.bigint "source_id", scale: 8
    t.integer "position", scale: 4
    t.index ["agency_id"], name: "index_maintains_on_agency_id"
    t.index ["agent_type", "agent_id"], name: "index_maintains_on_agent_type_and_agent_id"
    t.index ["client_type", "client_id"], name: "index_maintains_on_client_type_and_client_id"
    t.index ["maintain_source_id"], name: "index_maintains_on_maintain_source_id"
    t.index ["member_id"], name: "index_maintains_on_member_id"
    t.index ["organ_id"], name: "index_maintains_on_organ_id"
    t.index ["pipeline_id"], name: "index_maintains_on_pipeline_id"
    t.index ["pipeline_member_id"], name: "index_maintains_on_pipeline_member_id"
    t.index ["source_id"], name: "index_maintains_on_source_id"
    t.index ["upstream_id"], name: "index_maintains_on_upstream_id"
  end

  create_table "member_departments", force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "department_root_id", scale: 8
    t.bigint "department_id", scale: 8
    t.integer "grade", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "department_ancestors"
    t.bigint "superior_id", scale: 8
    t.bigint "super_job_title_id", scale: 8
    t.index ["department_id"], name: "index_member_departments_on_department_id"
    t.index ["department_root_id"], name: "index_member_departments_on_department_root_id"
    t.index ["job_title_id"], name: "index_member_departments_on_job_title_id"
    t.index ["member_id"], name: "index_member_departments_on_member_id"
    t.index ["super_job_title_id"], name: "index_member_departments_on_super_job_title_id"
    t.index ["superior_id"], name: "index_member_departments_on_superior_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "identity"
    t.string "number"
    t.date "join_on"
    t.boolean "enabled", default: true
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pomodoro", scale: 4
    t.bigint "organ_root_id", scale: 8
    t.boolean "owned"
    t.bigint "provider_id", scale: 8
    t.json "department_ancestors"
    t.string "experience"
    t.string "attendance_number"
    t.boolean "owner"
    t.integer "cached_role_ids", scale: 4, array: true
    t.index ["organ_id"], name: "index_members_on_organ_id"
    t.index ["organ_root_id"], name: "index_members_on_organ_root_id"
    t.index ["provider_id"], name: "index_members_on_provider_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "money_givens", force: :cascade do |t|
    t.string "type"
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.string "money_type"
    t.bigint "money_id", scale: 8
    t.string "title"
    t.index ["money_type", "money_id"], name: "index_money_givens_on_money_type_and_money_id"
    t.index ["organ_id"], name: "index_money_givens_on_organ_id"
  end

  create_table "notification_sendings", force: :cascade do |t|
    t.string "way"
    t.string "sent_to"
    t.datetime "sent_at"
    t.string "sent_result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "notification_id", scale: 8
    t.index ["notification_id"], name: "index_notification_sendings_on_notification_id"
  end

  create_table "notification_settings", id: :serial, scale: 4, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id", scale: 4
    t.string "notifiable_types"
    t.integer "showtime", scale: 4
    t.boolean "accept_email", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "counters", default: {}
    t.index ["receiver_type", "receiver_id"], name: "index_notification_settings_on_receiver_type_and_receiver_id"
  end

  create_table "notifications", id: :serial, scale: 4, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id", scale: 4
    t.string "notifiable_type"
    t.integer "notifiable_id", scale: 4
    t.string "code"
    t.integer "state", scale: 4, default: 0
    t.string "title"
    t.string "body", scale: 5000
    t.string "link"
    t.datetime "sending_at"
    t.datetime "read_at"
    t.boolean "verbose", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archived"
    t.boolean "official"
    t.bigint "organ_id", scale: 8
    t.string "sender_type"
    t.bigint "sender_id", scale: 8
    t.string "linked_type"
    t.bigint "linked_id", scale: 8
    t.index ["linked_type", "linked_id"], name: "index_notifications_on_linked_type_and_linked_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["organ_id"], name: "index_notifications_on_organ_id"
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["receiver_type", "receiver_id"], name: "index_notifications_on_receiver_type_and_receiver_id"
    t.index ["sender_type", "sender_id"], name: "index_notifications_on_sender_type_and_sender_id"
  end

  create_table "notify_settings", id: :serial, scale: 4, force: :cascade do |t|
    t.string "notifiable_type"
    t.string "code"
    t.string "notify_mailer"
    t.string "notify_method"
    t.string "only_verbose_columns"
    t.string "except_verbose_columns"
    t.string "cc_emails"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oauth_users", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "access_token"
    t.string "refresh_token"
    t.string "unionid"
    t.string "app_id"
    t.bigint "account_id", scale: 8
    t.datetime "expires_at"
    t.string "state"
    t.json "extra", default: {}
    t.index ["account_id"], name: "index_oauth_users_on_account_id"
    t.index ["user_id"], name: "index_oauth_users_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "uuid", null: false
    t.integer "state", scale: 4, default: 0
    t.decimal "amount", limit: 2, precision: 10
    t.decimal "received_amount", limit: 2, precision: 10
    t.decimal "item_amount", limit: 2, precision: 10
    t.string "currency"
    t.integer "payment_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payment_strategy_id", scale: 8
    t.boolean "myself"
    t.decimal "overall_reduced_amount", limit: 2, precision: 10
    t.decimal "overall_additional_amount", limit: 2, precision: 10
    t.string "buyer_type"
    t.bigint "buyer_id", scale: 8
    t.string "payment_status"
    t.bigint "user_id", scale: 8
    t.bigint "cart_id", scale: 8
    t.bigint "maintain_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.integer "lock_version", scale: 4
    t.string "note", scale: 4096
    t.datetime "expire_at"
    t.json "extra", default: {}
    t.index ["buyer_type", "buyer_id"], name: "index_orders_on_buyer_type_and_buyer_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["maintain_id"], name: "index_orders_on_maintain_id"
    t.index ["organ_id"], name: "index_orders_on_organ_id"
    t.index ["payment_strategy_id"], name: "index_orders_on_payment_strategy_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "organ_grants", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "token", null: false
    t.datetime "expire_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "session_organ_id", scale: 8
    t.boolean "mock"
    t.index ["member_id"], name: "index_organ_grants_on_member_id"
    t.index ["organ_id"], name: "index_organ_grants_on_organ_id"
    t.index ["session_organ_id"], name: "index_organ_grants_on_session_organ_id"
    t.index ["user_id"], name: "index_organ_grants_on_user_id"
  end

  create_table "organ_handles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "record_class"
    t.string "record_column"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "organ_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "organ_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "organ_desc_idx"
  end

  create_table "organ_tokens", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "token"
    t.datetime "expire_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_organ_tokens_on_organ_id"
    t.index ["user_id"], name: "index_organ_tokens_on_user_id"
  end

  create_table "organs", force: :cascade do |t|
    t.string "name"
    t.string "organ_uuid"
    t.integer "limit_wechat", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "area_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "address"
    t.string "locale"
    t.string "timezone"
    t.integer "members_count", scale: 4
    t.string "name_short"
    t.json "area_ancestors"
    t.integer "limit_wechat_menu", scale: 4, default: 1
    t.json "parent_ancestors"
    t.index ["area_id"], name: "index_organs_on_area_id"
    t.index ["parent_id"], name: "index_organs_on_parent_id"
  end

  create_table "part_items", force: :cascade do |t|
    t.bigint "part_id", scale: 8
    t.bigint "product_item_id", scale: 8
    t.string "qr_code"
    t.string "state"
    t.datetime "received_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_part_items_on_part_id"
    t.index ["product_item_id"], name: "index_part_items_on_product_item_id"
  end

  create_table "part_plans", force: :cascade do |t|
    t.bigint "part_id", scale: 8
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "state"
    t.integer "purchased_count", scale: 4, default: 0
    t.integer "received_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_part_plans_on_part_id"
  end

  create_table "part_taxon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "part_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "part_taxon_desc_idx"
  end

  create_table "part_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 1
    t.bigint "parent_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.integer "max_select", scale: 4
    t.integer "min_select", scale: 4
    t.json "parent_ancestors"
    t.boolean "take_stock", comment: "可盘点"
    t.index ["organ_id"], name: "index_part_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_part_taxons_on_parent_id"
  end

  create_table "parts", force: :cascade do |t|
    t.bigint "part_taxon_id", scale: 8
    t.string "name"
    t.string "description"
    t.string "qr_prefix"
    t.string "sku"
    t.string "type"
    t.integer "order_items_count", scale: 4, default: 0
    t.boolean "published", default: true
    t.decimal "price", limit: 2, precision: 10
    t.decimal "import_price", limit: 2, precision: 10
    t.decimal "profit_price", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.json "part_taxon_ancestors"
    t.index ["organ_id"], name: "index_parts_on_organ_id"
    t.index ["part_taxon_id"], name: "index_parts_on_part_taxon_id"
    t.index ["sku"], name: "index_parts_on_sku"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "type"
    t.string "account_name"
    t.string "account_num"
    t.string "bank"
    t.text "extra"
    t.boolean "verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", scale: 8
    t.boolean "myself", default: true
    t.index ["creator_id"], name: "index_payment_methods_on_creator_id"
  end

  create_table "payment_orders", force: :cascade do |t|
    t.bigint "payment_id", scale: 8
    t.bigint "order_id", scale: 8
    t.decimal "check_amount", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["order_id"], name: "index_payment_orders_on_order_id"
    t.index ["payment_id"], name: "index_payment_orders_on_payment_id"
  end

  create_table "payment_references", force: :cascade do |t|
    t.bigint "payment_method_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "buyer_type"
    t.bigint "buyer_id", scale: 8
    t.string "state"
    t.index ["buyer_type", "buyer_id"], name: "index_payment_references_on_buyer_type_and_buyer_id"
    t.index ["payment_method_id"], name: "index_payment_references_on_payment_method_id"
  end

  create_table "payment_strategies", force: :cascade do |t|
    t.string "name"
    t.string "strategy"
    t.integer "period", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "type", scale: 255
    t.decimal "total_amount", limit: 2, precision: 10
    t.decimal "fee_amount", limit: 2, precision: 10
    t.decimal "income_amount", limit: 2, precision: 10
    t.decimal "checked_amount", limit: 2, precision: 10
    t.decimal "adjust_amount", limit: 2, precision: 10, default: "0.0"
    t.string "payment_uuid", scale: 255
    t.string "notify_type", scale: 255
    t.datetime "notified_at"
    t.string "pay_status", scale: 255
    t.string "seller_identifier", scale: 255
    t.string "buyer_name", scale: 255
    t.string "buyer_identifier", scale: 255
    t.string "buyer_bank"
    t.integer "user_id", scale: 4
    t.string "currency", scale: 255
    t.string "comment"
    t.bigint "payment_method_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.bigint "organ_id", scale: 8
    t.bigint "creator_id", scale: 8
    t.boolean "verified", default: true
    t.integer "lock_version", scale: 4
    t.index ["creator_id"], name: "index_payments_on_creator_id"
    t.index ["organ_id"], name: "index_payments_on_organ_id"
    t.index ["payment_method_id"], name: "index_payments_on_payment_method_id"
  end

  create_table "payouts", force: :cascade do |t|
    t.string "type"
    t.string "payable_type"
    t.bigint "payable_id", scale: 8
    t.bigint "operator_id", scale: 8
    t.bigint "cash_id", scale: 8
    t.string "payout_uuid"
    t.decimal "requested_amount", limit: 2, precision: 10
    t.decimal "actual_amount", limit: 2, precision: 10
    t.string "state"
    t.datetime "paid_at"
    t.boolean "advance", default: false
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cash_id"], name: "index_payouts_on_cash_id"
    t.index ["operator_id"], name: "index_payouts_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_payouts_on_payable_type_and_payable_id"
  end

  create_table "pictures", id: :serial, scale: 4, force: :cascade do |t|
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pipeline_members", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "job_title_id", scale: 4
    t.integer "member_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", scale: 4, default: 1
    t.integer "pipeline_id", scale: 4
    t.string "color"
    t.string "name"
    t.index ["job_title_id"], name: "index_pipeline_members_on_job_title_id"
    t.index ["member_id"], name: "index_pipeline_members_on_member_id"
    t.index ["pipeline_id"], name: "index_pipeline_members_on_pipeline_id"
  end

  create_table "pipelines", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "piping_type"
    t.bigint "piping_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_pipelines_on_organ_id"
    t.index ["piping_type", "piping_id"], name: "index_pipelines_on_piping_type_and_piping_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "place_taxon_id", scale: 8
    t.string "description"
    t.bigint "area_id", scale: 8
    t.integer "seats_count", scale: 4, default: 0
    t.integer "plans_count", scale: 4, default: 0
    t.index ["area_id"], name: "index_places_on_area_id"
    t.index ["organ_id"], name: "index_places_on_organ_id"
    t.index ["place_taxon_id"], name: "index_places_on_place_taxon_id"
  end

  create_table "plan_attenders", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "plan_item_id", scale: 4
    t.string "attender_type"
    t.integer "attender_id", scale: 4
    t.integer "place_id", scale: 4
    t.boolean "attended"
    t.string "state"
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plan_participant_id", scale: 8
    t.bigint "plan_id", scale: 8
    t.index ["attender_type", "attender_id"], name: "index_plan_attenders_on_attender_type_and_attender_id"
    t.index ["place_id"], name: "index_plan_attenders_on_place_id"
    t.index ["plan_id"], name: "index_plan_attenders_on_plan_id"
    t.index ["plan_item_id"], name: "index_plan_attenders_on_plan_item_id"
    t.index ["plan_participant_id"], name: "index_plan_attenders_on_plan_participant_id"
  end

  create_table "plan_items", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "plan_id", scale: 4
    t.integer "time_item_id", scale: 4
    t.integer "place_id", scale: 4
    t.date "plan_on"
    t.string "repeat_index"
    t.integer "bookings_count", scale: 4, default: 0
    t.jsonb "extra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "time_list_id", scale: 8
    t.string "planned_type"
    t.bigint "planned_id", scale: 8
    t.bigint "event_id", scale: 8
    t.bigint "event_item_id", scale: 8
    t.integer "plan_participants_count", scale: 4, default: 0
    t.index ["event_id"], name: "index_plan_items_on_event_id"
    t.index ["event_item_id"], name: "index_plan_items_on_event_item_id"
    t.index ["place_id"], name: "index_plan_items_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_plan_items_on_planned_type_and_planned_id"
    t.index ["time_item_id"], name: "index_plan_items_on_time_item_id"
    t.index ["time_list_id"], name: "index_plan_items_on_time_list_id"
  end

  create_table "plan_participants", force: :cascade do |t|
    t.bigint "event_participant_id", scale: 8
    t.string "participant_type"
    t.bigint "participant_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "planning_type"
    t.bigint "planning_id", scale: 8
    t.string "type"
    t.string "status", comment: "默认 event_participant 有效"
    t.index ["event_participant_id"], name: "index_plan_participants_on_event_participant_id"
    t.index ["participant_type", "participant_id"], name: "index_plan_participants_on_participant_type_and_participant_id"
    t.index ["planning_type", "planning_id"], name: "index_plan_participants_on_planning_type_and_planning_id"
  end

  create_table "plans", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "time_list_id", scale: 4
    t.string "planned_type"
    t.integer "planned_id", scale: 4
    t.integer "place_id", scale: 4
    t.date "begin_on"
    t.date "end_on"
    t.string "repeat_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "repeat_count", scale: 4
    t.jsonb "repeat_days"
    t.string "title"
    t.date "produced_begin_on"
    t.date "produced_end_on"
    t.boolean "produce_done"
    t.index ["place_id"], name: "index_plans_on_place_id"
    t.index ["planned_type", "planned_id"], name: "index_plans_on_planned_type_and_planned_id"
    t.index ["time_list_id"], name: "index_plans_on_time_list_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "produces", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_items", force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.string "qr_code"
    t.string "state"
    t.datetime "produced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_items_on_product_id"
  end

  create_table "product_parts", force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.bigint "part_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "part_taxon_id", scale: 8
    t.index ["part_id"], name: "index_product_parts_on_part_id"
    t.index ["part_taxon_id"], name: "index_product_parts_on_part_taxon_id"
    t.index ["product_id"], name: "index_product_parts_on_product_id"
  end

  create_table "product_plans", force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "state"
    t.integer "planned_count", scale: 4, default: 0
    t.integer "produced_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_plans_on_product_id"
  end

  create_table "product_taxon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "product_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "product_taxon_desc_idx"
  end

  create_table "product_taxons", force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 1
    t.bigint "parent_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "profit_margin", limit: 2, precision: 4
    t.bigint "organ_id", scale: 8
    t.json "parent_ancestors"
    t.index ["organ_id"], name: "index_product_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_product_taxons_on_parent_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_taxon_id", scale: 8
    t.string "name"
    t.string "description"
    t.string "qr_prefix"
    t.string "sku"
    t.string "type"
    t.integer "order_items_count", scale: 4, default: 0
    t.boolean "published", default: true
    t.decimal "price", limit: 2, precision: 10
    t.decimal "profit_price", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "reference_price", limit: 2, precision: 10
    t.bigint "organ_id", scale: 8
    t.decimal "cost_price", limit: 2, precision: 10
    t.json "product_taxon_ancestors"
    t.index ["organ_id"], name: "index_products_on_organ_id"
    t.index ["product_taxon_id"], name: "index_products_on_product_taxon_id"
    t.index ["sku"], name: "index_products_on_sku"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "gender"
    t.string "birthday_type"
    t.date "birthday"
    t.string "identity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.index ["organ_id"], name: "index_profiles_on_organ_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "project_funds", force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", scale: 8
    t.string "name"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.string "buyer_type"
    t.integer "buyer_id", scale: 4
    t.index ["project_id"], name: "index_project_funds_on_project_id"
    t.index ["user_id"], name: "index_project_funds_on_user_id"
  end

  create_table "project_members", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "job_title_id", scale: 4
    t.integer "member_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id", scale: 4
    t.index ["job_title_id"], name: "index_project_members_on_job_title_id"
    t.index ["member_id"], name: "index_project_members_on_member_id"
    t.index ["project_id"], name: "index_project_members_on_project_id"
  end

  create_table "project_webhooks", force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.json "origin_data"
    t.json "valuable_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_webhooks_on_project_id"
  end

  create_table "projects", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id", scale: 4
    t.string "github_repo"
    t.index ["creator_id"], name: "index_projects_on_creator_id"
  end

  create_table "promote_buyers", force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "buyer_type"
    t.bigint "buyer_id", scale: 8
    t.string "state"
    t.string "status"
    t.integer "trade_promotes_count", scale: 4, default: 0
    t.bigint "promote_good_id", scale: 8
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.index ["buyer_type", "buyer_id"], name: "index_promote_buyers_on_buyer_type_and_buyer_id"
    t.index ["promote_good_id"], name: "index_promote_buyers_on_promote_good_id"
    t.index ["promote_id"], name: "index_promote_buyers_on_promote_id"
  end

  create_table "promote_charges", force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.decimal "min", limit: 2, precision: 10, default: "0.0"
    t.decimal "max", limit: 2, precision: 10, default: "99999999.99"
    t.decimal "parameter", limit: 2, precision: 10
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "contain_max"
    t.boolean "contain_min"
    t.decimal "base_price", limit: 2, precision: 10
    t.string "unit"
    t.decimal "filter_min", limit: 2, precision: 10
    t.decimal "filter_max", limit: 2, precision: 10
    t.index ["promote_id"], name: "index_promote_charges_on_promote_id"
  end

  create_table "promote_extras", force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.string "extra_name"
    t.string "column_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["promote_id"], name: "index_promote_extras_on_promote_id"
  end

  create_table "promote_goods", force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.bigint "promote_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["good_type", "good_id"], name: "index_promote_goods_on_good_type_and_good_id"
    t.index ["promote_id"], name: "index_promote_goods_on_promote_id"
  end

  create_table "promotes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false
    t.integer "sequence", scale: 4, default: 1
    t.string "scope"
    t.string "extra", array: true
    t.string "short_name"
    t.string "description"
    t.string "code"
    t.string "deal_type"
    t.bigint "deal_id", scale: 8
    t.string "metering"
    t.boolean "editable"
    t.bigint "organ_id", scale: 8
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.index ["deal_type", "deal_id"], name: "index_promotes_on_deal_type_and_deal_id"
    t.index ["organ_id"], name: "index_promotes_on_organ_id"
  end

  create_table "providers", force: :cascade do |t|
    t.bigint "area_id", scale: 8
    t.string "type"
    t.string "name"
    t.string "service_tel"
    t.string "service_qq"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_providers_on_area_id"
  end

  create_table "quip_apps", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "access_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_quip_apps_on_organ_id"
    t.index ["user_id"], name: "index_quip_apps_on_user_id"
  end

  create_table "quip_threads", force: :cascade do |t|
    t.bigint "quip_app_id", scale: 8
    t.string "type"
    t.string "title"
    t.string "html"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quip_app_id"], name: "index_quip_threads_on_quip_app_id"
  end

  create_table "record_items", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "record_list_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "fields"
    t.index ["record_list_id"], name: "index_record_items_on_record_list_id"
  end

  create_table "record_lists", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "data_list_id", scale: 4
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "parameters"
    t.jsonb "columns"
    t.index ["data_list_id"], name: "index_record_lists_on_data_list_id"
  end

  create_table "refunds", force: :cascade do |t|
    t.bigint "order_id", scale: 8
    t.bigint "payment_id", scale: 8
    t.bigint "operator_id", scale: 8
    t.string "type"
    t.decimal "total_amount", limit: 2, precision: 10
    t.string "buyer_identifier"
    t.string "comment", scale: 512
    t.integer "state", scale: 4, default: 0
    t.datetime "refunded_at"
    t.string "reason", scale: 512
    t.string "currency"
    t.string "refund_uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operator_id"], name: "index_refunds_on_operator_id"
    t.index ["order_id"], name: "index_refunds_on_order_id"
    t.index ["payment_id"], name: "index_refunds_on_payment_id"
  end

  create_table "resign_reasons", force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4
    t.integer "resigns_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resign_references", force: :cascade do |t|
    t.bigint "resign_id", scale: 8
    t.bigint "resign_reason_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resign_id"], name: "index_resign_references_on_resign_id"
    t.index ["resign_reason_id"], name: "index_resign_references_on_resign_reason_id"
  end

  create_table "resigns", force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.string "state", default: "init"
    t.date "leave_on"
    t.string "reason_note", scale: 4096
    t.string "handover_note", scale: 4096
    t.string "comment", scale: 4096
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_resigns_on_member_id"
  end

  create_table "role_rules", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "role_id", scale: 4
    t.integer "rule_id", scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "govern_id", scale: 8
    t.bigint "govern_taxon_id", scale: 8
    t.string "status", default: "available"
    t.index ["govern_id"], name: "index_role_rules_on_govern_id"
    t.index ["govern_taxon_id"], name: "index_role_rules_on_govern_taxon_id"
  end

  create_table "role_types", force: :cascade do |t|
    t.bigint "role_id", scale: 8
    t.string "who_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_role_types_on_role_id"
  end

  create_table "roles", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "visible"
    t.string "code"
    t.string "who_types", array: true
  end

  create_table "rules", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "govern_id", scale: 4
    t.integer "position", scale: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "params"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seats", force: :cascade do |t|
    t.bigint "place_id", scale: 8
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_seats_on_place_id"
  end

  create_table "serve_goods", force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.bigint "serve_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_type", "good_id"], name: "index_serve_goods_on_good_type_and_good_id"
    t.index ["serve_id"], name: "index_serve_goods_on_serve_id"
  end

  create_table "super_job_titles", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "description"
    t.integer "grade", scale: 4
    t.integer "limit_member", scale: 4
    t.integer "cached_role_ids", scale: 4, array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_super_job_titles_on_organ_id"
  end

  create_table "supports", force: :cascade do |t|
    t.bigint "department_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "member_id", scale: 8
    t.string "name"
    t.integer "grade", scale: 4
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "supporter_id", scale: 8
    t.json "department_ancestors"
    t.index ["department_id"], name: "index_supports_on_department_id"
    t.index ["member_id"], name: "index_supports_on_member_id"
    t.index ["organ_id"], name: "index_supports_on_organ_id"
    t.index ["supporter_id"], name: "index_supports_on_supporter_id"
  end

  create_table "table_items", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "table_list_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fields", array: true
    t.index ["table_list_id"], name: "index_table_items_on_table_list_id"
  end

  create_table "table_lists", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "data_list_id", scale: 4
    t.integer "table_items_count", scale: 4, default: 0
    t.string "timestamp"
    t.boolean "done"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "headers", array: true
    t.string "footers", array: true
    t.jsonb "parameters"
    t.index ["data_list_id"], name: "index_table_lists_on_data_list_id"
  end

  create_table "taggeds", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "tag_id", scale: 4
    t.string "tagging_type"
    t.integer "tagging_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggeds_on_tag_id"
    t.index ["tagging_type", "tagging_id"], name: "index_taggeds_on_tagging_type_and_tagging_id"
  end

  create_table "tags", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "taggeds_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_contents", force: :cascade do |t|
    t.bigint "task_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_task_contents_on_task_id"
  end

  create_table "task_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "task_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "task_desc_idx"
  end

  create_table "task_templates", force: :cascade do |t|
    t.string "title"
    t.integer "parent_id", scale: 4
    t.integer "position", scale: 4, default: 1
    t.integer "pipeline_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tasking_type"
    t.bigint "tasking_id", scale: 8
    t.index ["tasking_type", "tasking_id"], name: "index_task_templates_on_tasking_type_and_tasking_id"
  end

  create_table "task_timers", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "task_id", scale: 4
    t.integer "duration", scale: 4
    t.datetime "finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_timers_on_task_id"
  end

  create_table "tasks", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "project_id", scale: 4
    t.string "title"
    t.integer "parent_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", scale: 4, default: 0
    t.integer "focus", scale: 4, default: 0
    t.string "repeat_type"
    t.integer "repeat_days", scale: 4, array: true
    t.integer "position", scale: 4, default: 1
    t.integer "estimated_time", scale: 4
    t.integer "actual_time", scale: 4
    t.datetime "done_at"
    t.integer "children_count", scale: 4, default: 0
    t.bigint "detail_id", scale: 8
    t.bigint "pipeline_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "start_at"
    t.json "parent_ancestors"
    t.index ["detail_id"], name: "index_tasks_on_detail_id"
    t.index ["member_id"], name: "index_tasks_on_member_id"
    t.index ["pipeline_id"], name: "index_tasks_on_pipeline_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "taxon_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "taxon_desc_idx"
  end

  create_table "taxon_items", force: :cascade do |t|
    t.string "taxon_type"
    t.bigint "taxon_id", scale: 8
    t.bigint "list_id", scale: 8
    t.bigint "item_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_taxon_items_on_item_id"
    t.index ["list_id"], name: "index_taxon_items_on_list_id"
    t.index ["taxon_type", "taxon_id"], name: "index_taxon_items_on_taxon_type_and_taxon_id"
  end

  create_table "taxons", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "color"
    t.string "description"
    t.integer "position", scale: 4, default: 1
    t.integer "entities_count", scale: 4, default: 0
    t.integer "parent_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "parent_ancestors"
    t.index ["parent_id"], name: "index_taxons_on_parent_id"
  end

  create_table "team_members", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "team_id", scale: 4
    t.integer "job_title_id", scale: 4
    t.integer "member_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_team_members_on_job_title_id"
    t.index ["member_id"], name: "index_team_members_on_member_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "teaming_type"
    t.integer "teaming_id", scale: 4
    t.string "description", scale: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_teams_on_organ_id"
  end

  create_table "ticket_items", force: :cascade do |t|
    t.bigint "ticket_id", scale: 8
    t.bigint "wechat_user_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "wechat_request_id", scale: 8
    t.integer "serial_number", scale: 4
    t.index ["ticket_id"], name: "index_ticket_items_on_ticket_id"
    t.index ["wechat_request_id"], name: "index_ticket_items_on_wechat_request_id"
    t.index ["wechat_user_id"], name: "index_ticket_items_on_wechat_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "match_value"
    t.integer "serial_start", scale: 4
    t.time "start_at"
    t.time "finish_at"
    t.string "valid_response"
    t.string "invalid_response"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_tickets_on_organ_id"
  end

  create_table "time_items", id: :serial, scale: 4, force: :cascade do |t|
    t.integer "time_list_id", scale: 4
    t.time "start_at"
    t.time "finish_at"
    t.integer "position", scale: 4, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_list_id"], name: "index_time_items_on_time_list_id"
  end

  create_table "time_lists", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "interval_minutes", scale: 4, default: 0
    t.integer "item_minutes", scale: 4, default: 45
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.string "kind"
    t.index ["organ_id"], name: "index_time_lists_on_organ_id"
  end

  create_table "trade_items", force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number", scale: 4
    t.decimal "reduced_amount", limit: 2, precision: 10
    t.decimal "additional_amount", limit: 2, precision: 10
    t.string "trade_type"
    t.bigint "trade_id", scale: 8
    t.decimal "single_price", limit: 2, precision: 10
    t.boolean "myself"
    t.boolean "starred"
    t.decimal "original_amount", limit: 2, precision: 10
    t.decimal "retail_price", limit: 2, precision: 10
    t.decimal "wholesale_price", limit: 2, precision: 10
    t.string "status"
    t.string "good_name"
    t.decimal "weight", default: "0.0", comment: "重量"
    t.string "unit", comment: "单位"
    t.string "note"
    t.decimal "advance_amount", default: "0.0"
    t.json "extra", default: {}
    t.index ["good_type", "good_id"], name: "index_trade_items_on_good_type_and_good_id"
    t.index ["trade_type", "trade_id"], name: "index_trade_items_on_trade_type_and_trade_id"
  end

  create_table "trade_promotes", force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.bigint "promote_charge_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promote_buyer_id", scale: 8
    t.string "trade_type"
    t.bigint "trade_id", scale: 8
    t.bigint "trade_item_id", scale: 8
    t.bigint "promote_good_id", scale: 8
    t.string "scope"
    t.integer "sequence", scale: 4
    t.decimal "based_amount", limit: 2, precision: 10
    t.decimal "original_amount", limit: 2, precision: 10
    t.decimal "computed_amount", limit: 2, precision: 10
    t.string "note"
    t.index ["promote_buyer_id"], name: "index_trade_promotes_on_promote_buyer_id"
    t.index ["promote_charge_id"], name: "index_trade_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_promotes_on_promote_id"
    t.index ["trade_item_id"], name: "index_trade_promotes_on_trade_item_id"
    t.index ["trade_type", "trade_id"], name: "index_trade_promotes_on_trade_type_and_trade_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "tutor_id", scale: 8
    t.string "kind"
    t.string "state"
    t.string "accepted_status"
    t.string "verified"
    t.date "start_on"
    t.date "finish_on"
    t.string "performance"
    t.integer "allowance", scale: 4
    t.string "note", scale: 4096
    t.string "comment", scale: 4096
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_tutorials_on_member_id"
    t.index ["tutor_id"], name: "index_tutorials_on_tutor_id"
  end

  create_table "user_providers", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_user_providers_on_provider_id"
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "user_taggeds", force: :cascade do |t|
    t.bigint "user_tag_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_taggeds_on_user_id"
    t.index ["user_tag_id"], name: "index_user_taggeds_on_user_tag_id"
  end

  create_table "user_tags", force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "tagging_type"
    t.bigint "tagging_id", scale: 8
    t.string "name"
    t.integer "user_taggeds_count", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_user_tags_on_organ_id"
    t.index ["tagging_type", "tagging_id"], name: "index_user_tags_on_tagging_type_and_tagging_id"
  end

  create_table "users", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "last_login_at"
    t.inet "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "disabled", default: false
    t.integer "pomodoro", scale: 4, default: 25
    t.string "timezone"
    t.string "locale"
    t.string "source"
    t.integer "cached_role_ids", scale: 4, array: true
    t.string "invited_code"
    t.integer "provider_id", scale: 4
  end

  create_table "verify_tokens", force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "type", scale: 100
    t.string "token"
    t.datetime "expire_at"
    t.string "identity"
    t.integer "access_counter", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id", scale: 8
    t.index ["account_id"], name: "index_verify_tokens_on_account_id"
    t.index ["user_id"], name: "index_verify_tokens_on_user_id"
  end

  create_table "wechat_app_extractors", force: :cascade do |t|
    t.bigint "extractor_id", scale: 8
    t.bigint "wechat_app_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["extractor_id"], name: "index_wechat_app_extractors_on_extractor_id"
    t.index ["wechat_app_id"], name: "index_wechat_app_extractors_on_wechat_app_id"
  end

  create_table "wechat_apps", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "enabled", default: true
    t.string "appid"
    t.string "secret"
    t.string "agentid"
    t.boolean "encrypt_mode"
    t.string "encoding_aes_key"
    t.string "token", null: false
    t.string "access_token"
    t.string "jsapi_ticket"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "help", scale: 1024
    t.string "help_user_disabled"
    t.string "help_without_user"
    t.bigint "organ_id", scale: 8
    t.string "help_feedback"
    t.string "type"
    t.datetime "access_token_expires_at"
    t.datetime "jsapi_ticket_expires_at"
    t.string "mch_id"
    t.string "key"
    t.boolean "primary"
    t.index ["organ_id"], name: "index_wechat_apps_on_organ_id"
  end

  create_table "wechat_menus", force: :cascade do |t|
    t.bigint "wechat_app_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "type"
    t.string "menu_type"
    t.string "name"
    t.string "value"
    t.string "appid"
    t.string "pagepath"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position", scale: 4
    t.index ["parent_id"], name: "index_wechat_menus_on_parent_id"
    t.index ["wechat_app_id"], name: "index_wechat_menus_on_wechat_app_id"
  end

  create_table "wechat_messages", force: :cascade do |t|
    t.bigint "wechat_app_id", scale: 8
    t.bigint "wechat_template_id", scale: 8
    t.string "messaging_type"
    t.bigint "messaging_id", scale: 8
    t.string "type"
    t.string "value"
    t.json "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["messaging_type", "messaging_id"], name: "index_wechat_messages_on_messaging_type_and_messaging_id"
    t.index ["wechat_app_id"], name: "index_wechat_messages_on_wechat_app_id"
    t.index ["wechat_template_id"], name: "index_wechat_messages_on_wechat_template_id"
  end

  create_table "wechat_notices", force: :cascade do |t|
    t.bigint "wechat_template_id", scale: 8
    t.bigint "wechat_app_id", scale: 8
    t.string "notifiable_type"
    t.string "code", default: "default"
    t.json "mappings", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_app_id"], name: "index_wechat_notices_on_wechat_app_id"
    t.index ["wechat_template_id"], name: "index_wechat_notices_on_wechat_template_id"
  end

  create_table "wechat_requests", force: :cascade do |t|
    t.bigint "wechat_user_id", scale: 8
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "wechat_app_id", scale: 8
    t.string "type"
    t.index ["wechat_app_id"], name: "index_wechat_requests_on_wechat_app_id"
    t.index ["wechat_user_id"], name: "index_wechat_requests_on_wechat_user_id"
  end

  create_table "wechat_responses", force: :cascade do |t|
    t.bigint "wechat_app_id", scale: 8
    t.string "match_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "expire_seconds", scale: 4
    t.string "type"
    t.string "qrcode_ticket"
    t.string "qrcode_url"
    t.datetime "expire_at"
    t.string "effective_type"
    t.bigint "effective_id", scale: 8
    t.index ["effective_type", "effective_id"], name: "index_wechat_responses_on_effective_type_and_effective_id"
    t.index ["wechat_app_id"], name: "index_wechat_responses_on_wechat_app_id"
  end

  create_table "wechat_subscribeds", force: :cascade do |t|
    t.bigint "wechat_user_id", scale: 8
    t.bigint "wechat_notice_id", scale: 8
    t.bigint "wechat_template_id", scale: 8
    t.datetime "sending_at"
    t.string "status", default: "accept"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_notice_id"], name: "index_wechat_subscribeds_on_wechat_notice_id"
    t.index ["wechat_template_id"], name: "index_wechat_subscribeds_on_wechat_template_id"
    t.index ["wechat_user_id"], name: "index_wechat_subscribeds_on_wechat_user_id"
  end

  create_table "wechat_tag_defaults", force: :cascade do |t|
    t.string "name"
    t.string "default_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wechat_tags", force: :cascade do |t|
    t.bigint "wechat_app_id", scale: 8
    t.string "name"
    t.string "tag_id"
    t.integer "count", scale: 4
    t.integer "wechat_user_tags_count", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_tag_id", scale: 8
    t.string "tagging_type"
    t.bigint "tagging_id", scale: 8
    t.index ["tagging_type", "tagging_id"], name: "index_wechat_tags_on_tagging_type_and_tagging_id"
    t.index ["user_tag_id"], name: "index_wechat_tags_on_user_tag_id"
    t.index ["wechat_app_id"], name: "index_wechat_tags_on_wechat_app_id"
  end

  create_table "wechat_templates", force: :cascade do |t|
    t.bigint "wechat_app_id", scale: 8
    t.string "template_id"
    t.string "title"
    t.string "content"
    t.string "example"
    t.integer "template_type", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_app_id"], name: "index_wechat_templates_on_wechat_app_id"
  end

  create_table "wechat_user_tags", force: :cascade do |t|
    t.bigint "wechat_user_id", scale: 8
    t.bigint "wechat_tag_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_tagged_id", scale: 8
    t.index ["user_tagged_id"], name: "index_wechat_user_tags_on_user_tagged_id"
    t.index ["wechat_tag_id"], name: "index_wechat_user_tags_on_wechat_tag_id"
    t.index ["wechat_user_id"], name: "index_wechat_user_tags_on_wechat_user_id"
  end

  create_table "who_roles", force: :cascade do |t|
    t.string "who_type"
    t.bigint "who_id", scale: 8
    t.bigint "role_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_who_roles_on_role_id"
    t.index ["who_type", "who_id"], name: "index_who_roles_on_who_type_and_who_id"
  end

  create_table "whos", id: :serial, scale: 4, force: :cascade do |t|
    t.string "name", null: false
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
