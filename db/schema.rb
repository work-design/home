# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_09_182626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absence_stats", id: { scale: 8 }, force: :cascade do |t|
    t.string "year"
    t.float "annual_days"
    t.float "annual_add"
    t.float "left_annual_days"
    t.float "vacation_days"
    t.string "details", scale: 1024
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "member_id", scale: 8
    t.index ["member_id"], name: "index_absence_stats_on_member_id"
  end

  create_table "absences", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "merged_id", scale: 8
    t.string "type"
    t.string "state", default: "init"
    t.float "hours", default: 0.0
    t.string "kind"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "note", scale: 2048
    t.string "comment", scale: 2048
    t.boolean "redeeming"
    t.string "redeeming_days", array: true
    t.boolean "processed"
    t.boolean "divided"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_absences_on_member_id"
    t.index ["merged_id"], name: "index_absences_on_merged_id"
  end

  create_table "abuses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "abusement_type"
    t.bigint "abusement_id", scale: 8
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["abusement_type", "abusement_id"], name: "index_abuses_on_abusement_type_and_abusement_id"
    t.index ["user_id"], name: "index_abuses_on_user_id"
  end

  create_table "accessories", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "accounts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "type"
    t.string "identity"
    t.boolean "confirmed", default: false
    t.boolean "primary", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "acme_accounts", id: { scale: 8 }, force: :cascade do |t|
    t.string "email"
    t.string "kid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "acme_identifiers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "acme_order_id", scale: 8
    t.string "identifier"
    t.string "file_name"
    t.string "file_content"
    t.string "record_name"
    t.string "record_content"
    t.string "domain"
    t.boolean "wildcard"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["acme_order_id"], name: "index_acme_identifiers_on_acme_order_id"
  end

  create_table "acme_orders", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "acme_account_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "orderid"
    t.string "url"
    t.index ["acme_account_id"], name: "index_acme_orders_on_acme_account_id"
  end

  create_table "action_mailbox_inbound_emails", id: { scale: 8 }, force: :cascade do |t|
    t.integer "status", scale: 4, default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", id: { scale: 8 }, force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", scale: 4, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", id: { scale: 8 }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", scale: 8, null: false
    t.bigint "blob_id", scale: 8, null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blob_defaults", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "blob_id", scale: 8
    t.string "record_class"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private"
    t.index ["blob_id"], name: "index_active_storage_blob_defaults_on_blob_id"
  end

  create_table "active_storage_blobs", id: { scale: 8 }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", scale: 8, null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "blob_id", scale: 8
    t.string "variation_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_variant_records_on_blob_id"
  end

  create_table "address_users", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "address_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "inviter_id", scale: 8
    t.decimal "commission_ratio", limit: 2, precision: 4, default: "0.0", comment: "佣金比例"
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "ordinary"
    t.index ["address_id"], name: "index_address_users_on_address_id"
    t.index ["inviter_id"], name: "index_address_users_on_inviter_id"
    t.index ["user_id"], name: "index_address_users_on_user_id"
  end

  create_table "addresses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "area_id", scale: 8
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "contact"
    t.string "tel"
    t.string "post_code"
    t.string "source"
    t.string "cached_key"
    t.index ["area_id"], name: "index_addresses_on_area_id"
  end

  create_table "advances", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "agencies", id: { scale: 8 }, force: :cascade do |t|
    t.string "relation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", scale: 8
    t.bigint "agent_id", scale: 8
    t.decimal "commission_ratio", limit: 2, precision: 4, comment: "交易时抽成比例"
    t.string "note", comment: "备注"
  end

  create_table "aim_codes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.string "controller_path"
    t.string "action_name"
    t.string "code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aim_id"], name: "index_aim_codes_on_aim_id"
  end

  create_table "aim_entities", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.bigint "reward_expense_id", scale: 8
    t.integer "present_point", scale: 4
    t.string "state"
    t.string "serial_number"
    t.datetime "last_access_at"
    t.string "ip"
    t.decimal "reward_amount", limit: 2, precision: 10
    t.integer "aim_logs_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aim_id"], name: "index_aim_entities_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_aim_entities_on_entity_type_and_entity_id"
    t.index ["reward_expense_id"], name: "index_aim_entities_on_reward_expense_id"
    t.index ["user_id"], name: "index_aim_entities_on_user_id"
  end

  create_table "aim_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.string "serial_number"
    t.string "ip"
    t.string "code"
    t.boolean "rewarded"
    t.datetime "created_at", null: false
    t.index ["aim_id"], name: "index_aim_logs_on_aim_id"
    t.index ["entity_type", "entity_id"], name: "index_aim_logs_on_entity_type_and_entity_id"
    t.index ["user_id"], name: "index_aim_logs_on_user_id"
  end

  create_table "aim_users", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "aim_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "serial_number"
    t.string "state", default: "task_doing"
    t.integer "reward_amount", scale: 4, default: 0
    t.integer "aim_entities_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aim_id"], name: "index_aim_users_on_aim_id"
    t.index ["user_id"], name: "index_aim_users_on_user_id"
  end

  create_table "aims", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "repeat_type"
    t.decimal "rate", limit: 2, precision: 10, default: "1.0"
    t.integer "task_point", scale: 4, default: 0
    t.integer "reward_point", scale: 4, default: 0
    t.integer "reward_amount", scale: 4, default: 0
    t.boolean "verbose"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "annunciates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "annunciation_id", scale: 8
    t.bigint "user_tag_id", scale: 8
    t.string "state"
    t.datetime "annunciated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "notifications_count", scale: 4, default: 0
    t.index ["annunciation_id"], name: "index_annunciates_on_annunciation_id"
    t.index ["user_tag_id"], name: "index_annunciates_on_user_tag_id"
  end

  create_table "annunciations", id: { scale: 8 }, force: :cascade do |t|
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
    t.string "type"
    t.index ["organ_id"], name: "index_annunciations_on_organ_id"
    t.index ["publisher_type", "publisher_id"], name: "index_annunciations_on_publisher_type_and_publisher_id"
  end

  create_table "approvals", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "areas", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "names", array: true
    t.bigint "parent_id", scale: 8
    t.boolean "published", default: true
    t.boolean "popular", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "parent_ancestors"
    t.string "timezone"
    t.string "locale"
    t.index ["parent_id"], name: "index_areas_on_parent_id"
  end

  create_table "attendance_logs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "attendance_id", scale: 8
    t.string "source", default: "machine"
    t.string "state", default: "init"
    t.string "name"
    t.datetime "record_at"
    t.boolean "processed"
    t.string "kind"
    t.string "note"
    t.string "record_at_str"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "number"
    t.index ["attendance_id"], name: "index_attendance_logs_on_attendance_id"
    t.index ["member_id"], name: "index_attendance_logs_on_member_id"
  end

  create_table "attendance_settings", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "financial_month_id", scale: 8
    t.string "state", default: "init"
    t.string "on_time", default: "08:30"
    t.string "off_time"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_month_id"], name: "index_attendance_settings_on_financial_month_id"
    t.index ["member_id"], name: "index_attendance_settings_on_member_id"
  end

  create_table "attendance_stats", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "financial_month_id", scale: 8
    t.string "costed_absence", scale: 1024
    t.string "redeeming_absence", scale: 1024
    t.string "free_absence", scale: 1024
    t.integer "allowance_days", scale: 4
    t.integer "late_days", scale: 4
    t.float "absence_redeeming_hours"
    t.float "cost_absence_hours"
    t.float "holiday_redeeming_hours"
    t.boolean "processed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_month_id"], name: "index_attendance_stats_on_financial_month_id"
    t.index ["member_id"], name: "index_attendance_stats_on_member_id"
  end

  create_table "attendances", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "interval_absence_id", scale: 8
    t.bigint "late_absence_id", scale: 8
    t.bigint "leave_absence_id", scale: 8
    t.integer "late_minutes", scale: 4
    t.integer "leave_minutes", scale: 4
    t.float "overtime_hours"
    t.float "attend_hours"
    t.float "interval_hours"
    t.float "total_hours"
    t.date "attend_on"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "interval_start_at"
    t.datetime "interval_finish_at"
    t.string "kind"
    t.integer "absence_minutes", scale: 4
    t.boolean "absence_redeeming"
    t.string "lost_logs", array: true
    t.boolean "workday", default: true
    t.boolean "processed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interval_absence_id"], name: "index_attendances_on_interval_absence_id"
    t.index ["late_absence_id"], name: "index_attendances_on_late_absence_id"
    t.index ["leave_absence_id"], name: "index_attendances_on_leave_absence_id"
    t.index ["member_id"], name: "index_attendances_on_member_id"
  end

  create_table "attitudes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "attitudinal_type"
    t.bigint "attitudinal_id", scale: 8
    t.string "opinion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attitudinal_type", "attitudinal_id"], name: "index_attitudes_on_attitudinal_type_and_attitudinal_id"
    t.index ["user_id"], name: "index_attitudes_on_user_id"
  end

  create_table "audits", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "authorized_tokens", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "oauth_user_id", scale: 8
    t.bigint "account_id", scale: 8
    t.string "token"
    t.datetime "expire_at"
    t.string "session_key"
    t.integer "access_counter", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "member_id", scale: 8
    t.boolean "mock_member"
    t.boolean "mock_user"
    t.index ["account_id"], name: "index_authorized_tokens_on_account_id"
    t.index ["member_id"], name: "index_authorized_tokens_on_member_id"
    t.index ["oauth_user_id"], name: "index_authorized_tokens_on_oauth_user_id"
    t.index ["user_id", "oauth_user_id", "account_id", "token"], name: "index_authorized_tokens_on_unique_token", unique: true
    t.index ["user_id"], name: "index_authorized_tokens_on_user_id"
  end

  create_table "blob_defaults", id: { scale: 8 }, force: :cascade do |t|
    t.string "record_class", comment: "AR 类名，如 User"
    t.string "name", comment: "名称, attach 名称，如：avatar"
    t.boolean "private", comment: "是否私有"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "budgets", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "member_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.bigint "financial_taxon_id", scale: 8
    t.string "state", default: "init"
    t.string "subject"
    t.decimal "amount"
    t.string "note", scale: 4096
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_taxon_id"], name: "index_budgets_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_budgets_on_budgeting"
    t.index ["member_id"], name: "index_budgets_on_member_id"
    t.index ["organ_id"], name: "index_budgets_on_organ_id"
  end

  create_table "busynesses", id: { scale: 8 }, force: :cascade do |t|
    t.string "identifier"
    t.integer "position", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cache_lists", id: { scale: 8 }, force: :cascade do |t|
    t.string "path"
    t.string "key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "card_advances", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "card_expenses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "card_id", scale: 8
    t.string "consumable_type"
    t.bigint "consumable_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_expenses_on_card_id"
    t.index ["consumable_type", "consumable_id"], name: "index_card_expenses_on_consumable_type_and_consumable_id"
  end

  create_table "card_logs", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "card_returns", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "card_templates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.integer "valid_days", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["organ_id"], name: "index_card_templates_on_organ_id"
  end

  create_table "cards", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "cart_promotes", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "carts", id: { scale: 8 }, force: :cascade do |t|
    t.decimal "amount", limit: 2, precision: 10
    t.bigint "user_id", scale: 8
    t.bigint "payment_strategy_id", scale: 8
    t.integer "deposit_ratio", scale: 4
    t.bigint "organ_id", scale: 8
    t.integer "trade_items_count", scale: 4, default: 0
    t.decimal "retail_price", default: "0.0", comment: "商品汇总的原价"
    t.decimal "discount_price", default: "0.0"
    t.decimal "bulk_price", default: "0.0"
    t.decimal "total_reduced_amount", default: "0.0", comment: "汇总的减少价格"
    t.decimal "total_additional_amount", default: "0.0"
    t.decimal "total_quantity", default: "0.0"
    t.decimal "item_amount", default: "0.0"
    t.decimal "overall_additional_amount", default: "0.0"
    t.decimal "overall_reduced_amount", default: "0.0"
    t.bigint "address_id", scale: 8
    t.integer "lock_version", scale: 4
    t.decimal "original_amount", default: "0.0", comment: "原价，应用优惠之前的价格"
    t.bigint "member_id", scale: 8
    t.bigint "total_cart_id", scale: 8
    t.index ["address_id"], name: "index_carts_on_address_id"
    t.index ["member_id"], name: "index_carts_on_member_id"
    t.index ["organ_id"], name: "index_carts_on_organ_id"
    t.index ["payment_strategy_id"], name: "index_carts_on_payment_strategy_id"
    t.index ["total_cart_id"], name: "index_carts_on_total_cart_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cash_logs", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "cashes", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "charges", id: { scale: 8 }, force: :cascade do |t|
    t.string "unit"
    t.decimal "min", limit: 2, precision: 10
    t.decimal "max", limit: 2, precision: 10
    t.decimal "price", limit: 2, precision: 10
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "check_settings", id: { scale: 8 }, force: :cascade do |t|
    t.string "checking_type"
    t.bigint "checking_id", scale: 8
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checking_type", "checking_id"], name: "index_check_settings_on_checking_type_and_checking_id"
  end

  create_table "checks", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "comments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "commentable_type"
    t.bigint "commentable_id", scale: 8
    t.string "title"
    t.string "content"
    t.string "state"
    t.float "score", default: 0.0
    t.integer "liked_count", scale: 4, default: 0
    t.integer "star_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contents", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "crowd_members", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "crowds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "member_type"
    t.integer "crowd_members_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_crowds_on_organ_id"
  end

  create_table "custom_carts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "cart_id", scale: 8
    t.bigint "custom_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "total_cart_id", scale: 8
    t.string "state", default: "init"
    t.datetime "customized_at"
    t.index ["cart_id"], name: "index_custom_carts_on_cart_id"
    t.index ["custom_id"], name: "index_custom_carts_on_custom_id"
    t.index ["total_cart_id"], name: "index_custom_carts_on_total_cart_id"
  end

  create_table "custom_parts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "custom_id", scale: 8
    t.bigint "part_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "original_price", limit: 2, precision: 10
    t.decimal "price", limit: 2, precision: 10
    t.index ["custom_id"], name: "index_custom_parts_on_custom_id"
    t.index ["part_id"], name: "index_custom_parts_on_part_id"
  end

  create_table "customs", id: { scale: 8 }, force: :cascade do |t|
    t.string "state"
    t.string "qr_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "sku"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.string "str_part_ids"
    t.bigint "product_plan_id", scale: 8
    t.index ["organ_id"], name: "index_customs_on_organ_id"
    t.index ["product_id"], name: "index_customs_on_product_id"
    t.index ["product_plan_id"], name: "index_customs_on_product_plan_id"
  end

  create_table "data_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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
    t.integer "x_position", scale: 4
  end

  create_table "department_grants", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "departments", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "details", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "contents_count", scale: 4, default: 0
    t.integer "pictures_count", scale: 4, default: 0
    t.integer "links_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_items", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "event_crowds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.bigint "crowd_id", scale: 8
    t.integer "present_number", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["crowd_id"], name: "index_event_crowds_on_crowd_id"
    t.index ["event_id"], name: "index_event_crowds_on_event_id"
  end

  create_table "event_grants", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "grant_kind"
    t.string "grant_column"
    t.jsonb "filter", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_grants_on_event_id"
  end

  create_table "event_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_id", scale: 8
    t.string "name"
    t.bigint "author_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_event_items_on_author_id"
    t.index ["event_id"], name: "index_event_items_on_event_id"
  end

  create_table "event_participants", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "event_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_event_taxons_on_organ_id"
  end

  create_table "events", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "event_taxon_id", scale: 8
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

  create_table "expense_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "expense_id", scale: 8
    t.bigint "financial_taxon_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.string "note"
    t.string "state"
    t.integer "quantity", scale: 4, default: 1
    t.decimal "price", limit: 2, precision: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "budget_id", scale: 8
    t.decimal "budget_amount"
    t.index ["budget_id"], name: "index_expense_items_on_budget_id"
    t.index ["expense_id"], name: "index_expense_items_on_expense_id"
    t.index ["financial_taxon_id"], name: "index_expense_items_on_financial_taxon_id"
  end

  create_table "expense_members", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "expense_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "payment_method_id", scale: 8
    t.bigint "cash_id", scale: 8
    t.bigint "operator_id", scale: 8
    t.string "payable_type"
    t.bigint "payable_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.boolean "advance"
    t.string "state", default: "pending"
    t.string "note"
    t.string "type"
    t.string "payout_uuid"
    t.decimal "requested_amount", limit: 2, precision: 10
    t.decimal "actual_amount", limit: 2, precision: 10
    t.datetime "paid_at"
    t.string "account_bank"
    t.string "account_name"
    t.string "account_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cash_id"], name: "index_expense_members_on_cash_id"
    t.index ["expense_id"], name: "index_expense_members_on_expense_id"
    t.index ["member_id"], name: "index_expense_members_on_member_id"
    t.index ["operator_id"], name: "index_expense_members_on_operator_id"
    t.index ["payable_type", "payable_id"], name: "index_expense_members_on_payable_type_and_payable_id"
    t.index ["payment_method_id"], name: "index_expense_members_on_payment_method_id"
  end

  create_table "expenses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "payout_id", scale: 8
    t.bigint "creator_id", scale: 8
    t.bigint "financial_taxon_id", scale: 8
    t.bigint "payment_method_id", scale: 8
    t.string "type"
    t.string "state", default: "init"
    t.string "subject"
    t.decimal "amount", limit: 2, precision: 10
    t.string "note", scale: 4096
    t.integer "invoices_count", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organ_id", scale: 8
    t.bigint "budget_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.bigint "fund_id", scale: 8
    t.index ["budget_id"], name: "index_expenses_on_budget_id"
    t.index ["creator_id"], name: "index_expenses_on_creator_id"
    t.index ["financial_taxon_id"], name: "index_expenses_on_financial_taxon_id"
    t.index ["financial_type", "financial_id"], name: "index_expenses_on_financial"
    t.index ["fund_id"], name: "index_expenses_on_fund_id"
    t.index ["organ_id"], name: "index_expenses_on_organ_id"
    t.index ["payment_method_id"], name: "index_expenses_on_payment_method_id"
    t.index ["payout_id"], name: "index_expenses_on_payout_id"
  end

  create_table "extra_days", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.date "the_day"
    t.string "name"
    t.string "kind", comment: "holiday, workday"
    t.string "scope"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_extra_days_on_organ_id"
  end

  create_table "facilitate_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "facilitate_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "indicator_id", scale: 8
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facilitate_id"], name: "index_facilitate_indicators_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_facilitate_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_facilitate_indicators_on_indicator_id"
  end

  create_table "facilitate_providers", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "facilitate_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.boolean "selected"
    t.string "note"
    t.index ["facilitate_id"], name: "index_facilitate_providers_on_facilitate_id"
    t.index ["provider_id"], name: "index_facilitate_providers_on_provider_id"
  end

  create_table "facilitate_taxon_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "facilitate_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "facilitate_taxon_desc_idx"
  end

  create_table "facilitate_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 0
    t.integer "facilitates_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id", scale: 8
    t.json "parent_ancestors"
    t.bigint "organ_id", scale: 8
    t.bigint "project_taxon_id", scale: 8
    t.string "color"
    t.string "description"
    t.integer "indicators_count", scale: 4, default: 0
    t.index ["organ_id"], name: "index_facilitate_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_facilitate_taxons_on_parent_id"
    t.index ["project_taxon_id"], name: "index_facilitate_taxons_on_project_taxon_id"
  end

  create_table "facilitates", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "facilitate_taxon_id", scale: 8
    t.decimal "price", limit: 2, precision: 10
    t.string "sku"
    t.string "qr_prefix"
    t.decimal "quantity"
    t.string "unit"
    t.boolean "published", default: true
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.decimal "unified_quantity", default: "1.0"
    t.bigint "organ_id", scale: 8
    t.index ["facilitate_taxon_id"], name: "index_facilitates_on_facilitate_taxon_id"
    t.index ["organ_id"], name: "index_facilitates_on_organ_id"
  end

  create_table "financial_months", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.date "begin_date"
    t.date "end_date"
    t.string "working_days"
    t.string "color", default: "#8fdf82"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_financial_months_on_organ_id"
  end

  create_table "financial_taxon_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "financial_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "financial_taxon_desc_idx"
  end

  create_table "financial_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "parent_id", scale: 8
    t.jsonb "parent_ancestors"
    t.string "name"
    t.integer "position", scale: 4
    t.boolean "take_stock", comment: "是否有库存"
    t.boolean "individual", comment: "是否可盘点"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_financial_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_financial_taxons_on_parent_id"
  end

  create_table "fund_budgets", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "fund_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_type", "financial_id"], name: "index_fund_budgets_on_financial"
    t.index ["fund_id"], name: "index_fund_budgets_on_fund_id"
  end

  create_table "fund_expenses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "fund_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "fund_budget_id", scale: 8
    t.index ["financial_type", "financial_id"], name: "index_fund_expenses_on_financial"
    t.index ["fund_budget_id"], name: "index_fund_expenses_on_fund_budget_id"
    t.index ["fund_id"], name: "index_fund_expenses_on_fund_id"
  end

  create_table "fund_incomes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "fund_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.boolean "visible"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "note"
    t.string "state", default: "init"
    t.index ["financial_type", "financial_id"], name: "index_fund_incomes_on_financial"
    t.index ["fund_id"], name: "index_fund_incomes_on_fund_id"
    t.index ["user_id"], name: "index_fund_incomes_on_user_id"
  end

  create_table "fund_uses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "fund_id", scale: 8
    t.string "financial_type"
    t.bigint "financial_id", scale: 8
    t.decimal "budget_amount"
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_type", "financial_id"], name: "index_fund_uses_on_financial"
    t.index ["fund_id"], name: "index_fund_uses_on_fund_id"
  end

  create_table "funds", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.decimal "budget_amount"
    t.decimal "amount", default: "0.0"
    t.string "note"
    t.string "sku"
    t.decimal "price", limit: 2, precision: 10, default: "0.0"
    t.decimal "advance_price", default: "0.0"
    t.json "extra", default: {}
    t.string "unit"
    t.decimal "quantity", default: "0.0"
    t.decimal "unified_quantity", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "budget_detail", default: {}
    t.decimal "expense_amount", default: "0.0"
    t.jsonb "expense_detail", default: {}
  end

  create_table "good_partners", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "good_produces", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "good_id", scale: 8
    t.bigint "produce_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["good_id"], name: "index_good_produces_on_good_id"
    t.index ["produce_id"], name: "index_good_produces_on_produce_id"
  end

  create_table "good_providers", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "govern_taxon_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "govern_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "govern_taxon_desc_idx"
  end

  create_table "govern_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 0
    t.integer "governs_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
    t.bigint "parent_id", scale: 8
    t.jsonb "parent_ancestors"
    t.index ["parent_id"], name: "index_govern_taxons_on_parent_id"
  end

  create_table "governs", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "position", scale: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "identifier"
    t.string "namespace_identifier", default: "application"
    t.string "business_identifier"
  end

  create_table "indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "description"
    t.string "unit"
    t.decimal "reference_min"
    t.decimal "reference_max"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.string "target_source"
    t.index ["facilitate_taxon_id"], name: "index_indicators_on_facilitate_taxon_id"
    t.index ["organ_id"], name: "index_indicators_on_organ_id"
    t.index ["project_taxon_id"], name: "index_indicators_on_project_taxon_id"
  end

  create_table "infos", id: { scale: 8 }, force: :cascade do |t|
    t.string "code"
    t.string "value"
    t.string "version"
    t.string "platform"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "key"
    t.string "description", scale: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "list_id", scale: 8
    t.index ["list_id"], name: "index_items_on_list_id"
  end

  create_table "job_descriptions", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "job_titles", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "department_id", scale: 8
    t.bigint "department_root_id", scale: 8
    t.string "name"
    t.integer "grade", scale: 4
    t.integer "limit_member", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.integer "cached_role_ids", scale: 4, array: true
    t.bigint "super_job_title_id", scale: 8
    t.integer "super_grade", scale: 4
    t.index ["department_id"], name: "index_job_titles_on_department_id"
    t.index ["department_root_id"], name: "index_job_titles_on_department_root_id"
    t.index ["super_job_title_id"], name: "index_job_titles_on_super_job_title_id"
  end

  create_table "job_transfers", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "knowings", id: { scale: 8 }, force: :cascade do |t|
    t.string "knowable_type"
    t.bigint "knowable_id", scale: 8
    t.bigint "knowledge_id", scale: 8
    t.boolean "primary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["knowable_type", "knowable_id"], name: "index_knowings_on_knowable_type_and_knowable_id"
    t.index ["knowledge_id"], name: "index_knowings_on_knowledge_id"
  end

  create_table "knowledge_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "knowledge_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "knowledge_desc_idx"
  end

  create_table "knowledges", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "parent_id", scale: 8
    t.string "title"
    t.text "body"
    t.integer "position", scale: 4
    t.json "parent_ancestors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_knowledges_on_parent_id"
  end

  create_table "links", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "content_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_links_on_content_id"
  end

  create_table "lists", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4
    t.integer "items_count", scale: 4, default: 0
    t.integer "status", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_lists_on_organ_id"
  end

  create_table "log_csps", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "log_mailers", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "log_records", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "path"
    t.string "controller_name"
    t.string "action_name"
    t.string "exception", scale: 10240
    t.string "exception_object"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "exception_backtrace", array: true
    t.string "ip"
    t.jsonb "headers"
    t.jsonb "params"
    t.jsonb "cookie"
    t.jsonb "session"
  end

  create_table "logs", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "task_id", scale: 4
    t.datetime "started_at"
    t.datetime "stopped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_logs_on_task_id"
  end

  create_table "maintain_logs", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "maintain_source_templates", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintain_sources", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "maintain_source_template_id", scale: 8
    t.string "name"
    t.integer "maintains_count", scale: 4, default: 0
    t.index ["maintain_source_template_id"], name: "index_maintain_sources_on_maintain_source_template_id"
    t.index ["organ_id"], name: "index_maintain_sources_on_organ_id"
  end

  create_table "maintain_tag_templates", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "logged_type"
    t.string "entity_column"
    t.string "entity_value"
    t.integer "sequence", scale: 4
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintain_tags", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "maintains", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "client_id", scale: 8
    t.bigint "agent_id", scale: 8
    t.bigint "agency_id", scale: 8
    t.bigint "maintain_source_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "state"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "upstream_id", scale: 8
    t.bigint "source_id", scale: 8
    t.integer "position", scale: 4
    t.bigint "task_template_id", scale: 8
    t.index ["agency_id"], name: "index_maintains_on_agency_id"
    t.index ["maintain_source_id"], name: "index_maintains_on_maintain_source_id"
    t.index ["member_id"], name: "index_maintains_on_member_id"
    t.index ["organ_id"], name: "index_maintains_on_organ_id"
    t.index ["source_id"], name: "index_maintains_on_source_id"
    t.index ["task_template_id"], name: "index_maintains_on_task_template_id"
    t.index ["upstream_id"], name: "index_maintains_on_upstream_id"
  end

  create_table "member_annunciates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "annunciation_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "department_id", scale: 8
    t.integer "notifications_count", scale: 4, default: 0
    t.string "state"
    t.datetime "annunciated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annunciation_id"], name: "index_member_annunciates_on_annunciation_id"
    t.index ["department_id"], name: "index_member_annunciates_on_department_id"
    t.index ["job_title_id"], name: "index_member_annunciates_on_job_title_id"
  end

  create_table "member_departments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "department_root_id", scale: 8
    t.bigint "department_id", scale: 8
    t.integer "grade", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "department_ancestors"
    t.bigint "superior_id", scale: 8
    t.index ["department_id"], name: "index_member_departments_on_department_id"
    t.index ["department_root_id"], name: "index_member_departments_on_department_root_id"
    t.index ["job_title_id"], name: "index_member_departments_on_job_title_id"
    t.index ["member_id"], name: "index_member_departments_on_member_id"
    t.index ["superior_id"], name: "index_member_departments_on_superior_id"
  end

  create_table "members", id: { scale: 8 }, force: :cascade do |t|
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
    t.json "department_ancestors"
    t.string "experience"
    t.string "attendance_number"
    t.integer "cached_role_ids", scale: 4, array: true
    t.string "notifiable_types", default: [], array: true
    t.jsonb "counters", default: {}
    t.integer "showtime", scale: 4, default: 0
    t.boolean "accept_email", default: true
    t.index ["organ_id"], name: "index_members_on_organ_id"
    t.index ["organ_root_id"], name: "index_members_on_organ_root_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "mileposts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.integer "project_mileposts_count", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_mileposts_on_organ_id"
  end

  create_table "money_givens", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "name_spaces", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "identifier", default: "application"
    t.boolean "verify_organ"
    t.boolean "verify_member"
    t.boolean "verify_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news_reply_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "news_reply_id", scale: 8
    t.string "title"
    t.string "description"
    t.string "pic_url"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["news_reply_id"], name: "index_news_reply_items_on_news_reply_id"
  end

  create_table "notification_sendings", id: { scale: 8 }, force: :cascade do |t|
    t.string "way"
    t.string "sent_to"
    t.datetime "sent_at"
    t.string "sent_result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "notification_id", scale: 8
    t.index ["notification_id"], name: "index_notification_sendings_on_notification_id"
  end

  create_table "notification_settings", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "notifiable_types"
    t.integer "showtime", scale: 4
    t.boolean "accept_email", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "counters", default: {}
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.index ["member_id"], name: "index_notification_settings_on_member_id"
    t.index ["organ_id"], name: "index_notification_settings_on_organ_id"
    t.index ["user_id"], name: "index_notification_settings_on_user_id"
  end

  create_table "notifications", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "notifiable_type"
    t.integer "notifiable_id", scale: 4
    t.string "code"
    t.string "state", default: "0"
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
    t.bigint "user_id", scale: 8
    t.bigint "member_id", scale: 8
    t.index ["linked_type", "linked_id"], name: "index_notifications_on_linked_type_and_linked_id"
    t.index ["member_id"], name: "index_notifications_on_member_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id"
    t.index ["organ_id"], name: "index_notifications_on_organ_id"
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["sender_type", "sender_id"], name: "index_notifications_on_sender_type_and_sender_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "notify_settings", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "oauth_users", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "orders", id: { scale: 8 }, force: :cascade do |t|
    t.string "uuid", null: false
    t.string "state", default: "0"
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
    t.string "payment_status"
    t.bigint "user_id", scale: 8
    t.bigint "cart_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.integer "lock_version", scale: 4
    t.string "note", scale: 4096
    t.datetime "expire_at"
    t.json "extra", default: {}
    t.integer "trade_items_count", scale: 4, default: 0
    t.bigint "address_id", scale: 8
    t.bigint "produce_plan_id", scale: 8
    t.decimal "total_additional_amount", default: "0.0"
    t.decimal "total_reduced_amount", default: "0.0"
    t.decimal "original_amount", default: "0.0", comment: "原价，应用优惠之前的价格"
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["organ_id"], name: "index_orders_on_organ_id"
    t.index ["payment_strategy_id"], name: "index_orders_on_payment_strategy_id"
    t.index ["produce_plan_id"], name: "index_orders_on_produce_plan_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "organ_handles", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "organ_tokens", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "token"
    t.datetime "expire_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_organ_tokens_on_organ_id"
    t.index ["user_id"], name: "index_organ_tokens_on_user_id"
  end

  create_table "organs", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "limit_wechat", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "area_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "address"
    t.integer "members_count", scale: 4
    t.string "name_short"
    t.json "area_ancestors"
    t.integer "limit_wechat_menu", scale: 4, default: 1
    t.json "parent_ancestors"
    t.integer "cached_role_ids", scale: 4, array: true
    t.boolean "official", comment: "是否官方"
    t.boolean "joinable", comment: "是否可搜索并加入"
    t.string "domain"
    t.index ["area_id"], name: "index_organs_on_area_id"
    t.index ["parent_id"], name: "index_organs_on_parent_id"
  end

  create_table "overtimes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "member_id", scale: 8
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "note", scale: 1024
    t.string "comment", scale: 1024
    t.float "hours"
    t.string "state", default: "init"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["member_id"], name: "index_overtimes_on_member_id"
  end

  create_table "packageds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "package_id", scale: 8
    t.bigint "trade_item_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "trade_item_status"
    t.index ["package_id"], name: "index_packageds_on_package_id"
    t.index ["trade_item_id"], name: "index_packageds_on_trade_item_id"
  end

  create_table "packages", id: { scale: 8 }, force: :cascade do |t|
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "expected_on"
    t.string "pick_mode"
    t.bigint "address_id", scale: 8
    t.bigint "wait_item_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "produce_plan_id", scale: 8
    t.index ["address_id"], name: "index_packages_on_address_id"
    t.index ["produce_plan_id"], name: "index_packages_on_produce_plan_id"
    t.index ["user_id"], name: "index_packages_on_user_id"
    t.index ["wait_item_id"], name: "index_packages_on_wait_item_id"
  end

  create_table "part_items", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "part_plans", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "part_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4, default: 1
    t.bigint "parent_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.integer "max_select", scale: 4
    t.integer "min_select", scale: 4
    t.jsonb "parent_ancestors"
    t.boolean "take_stock", comment: "可盘点"
    t.index ["organ_id"], name: "index_part_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_part_taxons_on_parent_id"
  end

  create_table "parts", id: { scale: 8 }, force: :cascade do |t|
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
    t.jsonb "part_taxon_ancestors"
    t.index ["organ_id"], name: "index_parts_on_organ_id"
    t.index ["part_taxon_id"], name: "index_parts_on_part_taxon_id"
    t.index ["sku"], name: "index_parts_on_sku"
  end

  create_table "payment_methods", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "payment_orders", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "payment_id", scale: 8
    t.bigint "order_id", scale: 8
    t.decimal "check_amount", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["order_id"], name: "index_payment_orders_on_order_id"
    t.index ["payment_id"], name: "index_payment_orders_on_payment_id"
  end

  create_table "payment_references", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "payment_method_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "buyer_type"
    t.bigint "buyer_id", scale: 8
    t.string "state"
    t.index ["buyer_type", "buyer_id"], name: "index_payment_references_on_buyer_type_and_buyer_id"
    t.index ["payment_method_id"], name: "index_payment_references_on_payment_method_id"
  end

  create_table "payment_strategies", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "strategy"
    t.integer "period", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_types", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "payouts", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "pictures", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_taxon_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "place_taxon_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "place_taxon_desc_idx"
  end

  create_table "place_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "parent_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.decimal "profit_margin", limit: 2, precision: 4
    t.jsonb "parent_ancestors"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "places_count", scale: 4
    t.index ["organ_id"], name: "index_place_taxons_on_organ_id"
    t.index ["parent_id"], name: "index_place_taxons_on_parent_id"
  end

  create_table "places", id: { scale: 8 }, force: :cascade do |t|
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
    t.jsonb "place_taxon_ancestors"
    t.index ["area_id"], name: "index_places_on_area_id"
    t.index ["organ_id"], name: "index_places_on_organ_id"
    t.index ["place_taxon_id"], name: "index_places_on_place_taxon_id"
  end

  create_table "plan_attenders", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "plan_items", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "plan_participants", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "plans", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "post_syncs", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "post_id", scale: 8
    t.string "synced_type"
    t.bigint "synced_id", scale: 8
    t.datetime "synced_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "source_id"
    t.index ["post_id"], name: "index_post_syncs_on_post_id"
    t.index ["synced_type", "synced_id"], name: "index_post_syncs_on_synced_type_and_synced_id"
  end

  create_table "posts", id: { scale: 8 }, force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "content"
    t.string "link"
    t.string "html"
    t.bigint "organ_id", scale: 8
    t.string "thumb_media_id"
    t.index ["organ_id"], name: "index_posts_on_organ_id"
  end

  create_table "praise_incomes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "reward_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "earner_id", scale: 8
    t.string "source_type"
    t.bigint "source_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0", comment: "用户打赏"
    t.decimal "profit_amount", limit: 2, precision: 10, default: "0.0", comment: "平台收入"
    t.decimal "royalty_amount", limit: 2, precision: 10, default: "0.0", comment: "作者分成"
    t.decimal "reward_amount", limit: 2, precision: 10, default: "0.0", comment: "赏金池"
    t.string "state", default: "init"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["earner_id"], name: "index_praise_incomes_on_earner_id"
    t.index ["reward_id"], name: "index_praise_incomes_on_reward_id"
    t.index ["source_type", "source_id"], name: "index_praise_incomes_on_source_type_and_source_id"
    t.index ["user_id"], name: "index_praise_incomes_on_user_id"
  end

  create_table "praise_users", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "reward_id", scale: 8
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.integer "position", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_type", "entity_id"], name: "index_praise_users_on_entity_type_and_entity_id"
    t.index ["reward_id"], name: "index_praise_users_on_reward_id"
    t.index ["user_id"], name: "index_praise_users_on_user_id"
  end

  create_table "produce_plans", id: { scale: 8 }, force: :cascade do |t|
    t.string "title"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_produce_plans_on_organ_id"
  end

  create_table "produces", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.string "qr_code"
    t.string "state"
    t.datetime "produced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_items_on_product_id"
  end

  create_table "product_parts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.bigint "part_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "part_taxon_id", scale: 8
    t.index ["part_id"], name: "index_product_parts_on_part_id"
    t.index ["part_taxon_id"], name: "index_product_parts_on_part_taxon_id"
    t.index ["product_id"], name: "index_product_parts_on_product_id"
  end

  create_table "product_plans", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "product_id", scale: 8
    t.datetime "start_at"
    t.datetime "finish_at"
    t.string "state"
    t.integer "planned_count", scale: 4, default: 0
    t.integer "produced_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "produce_plan_id", scale: 8
    t.index ["produce_plan_id"], name: "index_product_plans_on_produce_plan_id"
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

  create_table "product_taxons", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "products", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "profiles", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.string "gender"
    t.string "birthday_type"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.string "real_name"
    t.string "nick_name"
    t.index ["organ_id"], name: "index_profiles_on_organ_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "project_facilitates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "facilitate_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facilitate_id"], name: "index_project_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_project_facilitates_on_facilitate_taxon_id"
    t.index ["project_id"], name: "index_project_facilitates_on_project_id"
    t.index ["provider_id"], name: "index_project_facilitates_on_provider_id"
  end

  create_table "project_funds", id: { scale: 8 }, force: :cascade do |t|
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
    t.decimal "amount"
    t.string "note"
    t.decimal "budget"
    t.index ["project_id"], name: "index_project_funds_on_project_id"
    t.index ["user_id"], name: "index_project_funds_on_user_id"
  end

  create_table "project_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.bigint "indicator_id", scale: 8
    t.date "recorded_on"
    t.datetime "recorded_at"
    t.string "value"
    t.string "source"
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state"
    t.index ["indicator_id"], name: "index_project_indicators_on_indicator_id"
    t.index ["project_id"], name: "index_project_indicators_on_project_id"
  end

  create_table "project_members", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "job_title_id", scale: 4
    t.integer "member_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id", scale: 4
    t.boolean "owned"
    t.bigint "organ_id", scale: 8
    t.string "source"
    t.index ["job_title_id"], name: "index_project_members_on_job_title_id"
    t.index ["member_id"], name: "index_project_members_on_member_id"
    t.index ["organ_id"], name: "index_project_members_on_organ_id"
    t.index ["project_id"], name: "index_project_members_on_project_id"
  end

  create_table "project_mileposts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.bigint "milepost_id", scale: 8
    t.date "recorded_on"
    t.boolean "current"
    t.string "milepost_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["milepost_id"], name: "index_project_mileposts_on_milepost_id"
    t.index ["project_id"], name: "index_project_mileposts_on_project_id"
  end

  create_table "project_preferences", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "facilitate_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facilitate_id"], name: "index_project_preferences_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_project_preferences_on_facilitate_taxon_id"
    t.index ["project_taxon_id"], name: "index_project_preferences_on_project_taxon_id"
    t.index ["provider_id"], name: "index_project_preferences_on_provider_id"
  end

  create_table "project_stages", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.date "begin_on"
    t.date "end_on"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "note"
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.integer "projects_count", scale: 4
  end

  create_table "project_taxon_facilitates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "facilitate_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facilitate_id"], name: "index_project_taxon_facilitates_on_facilitate_id"
    t.index ["facilitate_taxon_id"], name: "index_project_taxon_facilitates_on_facilitate_taxon_id"
    t.index ["project_taxon_id"], name: "index_project_taxon_facilitates_on_project_taxon_id"
  end

  create_table "project_taxon_indicators", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_taxon_id", scale: 8
    t.bigint "facilitate_taxon_id", scale: 8
    t.bigint "indicator_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["facilitate_taxon_id"], name: "index_project_taxon_indicators_on_facilitate_taxon_id"
    t.index ["indicator_id"], name: "index_project_taxon_indicators_on_indicator_id"
    t.index ["project_taxon_id"], name: "index_project_taxon_indicators_on_project_taxon_id"
  end

  create_table "project_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "record_name", default: "ProjectTaxon"
    t.jsonb "parameters", default: {}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "fund_budget"
    t.decimal "fund_expense"
    t.decimal "budget_amount"
    t.decimal "expense_amount"
    t.integer "projects_count", scale: 4
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_project_taxons_on_organ_id"
  end

  create_table "project_webhooks", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "project_id", scale: 8
    t.json "origin_data"
    t.json "valuable_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_webhooks_on_project_id"
  end

  create_table "projects", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.bigint "project_taxon_id", scale: 8
    t.string "state"
    t.jsonb "extra"
    t.decimal "fund_expense"
    t.decimal "fund_budget"
    t.decimal "expense_amount"
    t.decimal "budget_amount"
    t.index ["organ_id"], name: "index_projects_on_organ_id"
    t.index ["project_taxon_id"], name: "index_projects_on_project_taxon_id"
  end

  create_table "promote_carts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "status"
    t.integer "trade_promotes_count", scale: 4, default: 0
    t.bigint "promote_good_id", scale: 8
    t.datetime "effect_at"
    t.datetime "expire_at"
    t.bigint "cart_id", scale: 8
    t.index ["cart_id"], name: "index_promote_carts_on_cart_id"
    t.index ["promote_good_id"], name: "index_promote_carts_on_promote_good_id"
    t.index ["promote_id"], name: "index_promote_carts_on_promote_id"
  end

  create_table "promote_charges", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "promote_extras", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.string "extra_name"
    t.string "column_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["promote_id"], name: "index_promote_extras_on_promote_id"
  end

  create_table "promote_goods", id: { scale: 8 }, force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.bigint "promote_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["good_type", "good_id"], name: "index_promote_goods_on_good_type_and_good_id"
    t.index ["promote_id"], name: "index_promote_goods_on_promote_id"
  end

  create_table "promotes", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "providers", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "quip_apps", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "access_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "private_folder_id"
    t.string "name"
    t.string "profile_picture_url"
    t.index ["organ_id"], name: "index_quip_apps_on_organ_id"
    t.index ["user_id"], name: "index_quip_apps_on_user_id"
  end

  create_table "quip_threads", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "quip_app_id", scale: 8
    t.string "type"
    t.string "title"
    t.string "html"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quip_app_id"], name: "index_quip_threads_on_quip_app_id"
  end

  create_table "rallies", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "area_id", scale: 8
    t.string "name"
    t.string "detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_rallies_on_area_id"
  end

  create_table "rally_users", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "rally_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "inviter_id", scale: 8
    t.decimal "commission_ratio", limit: 2, precision: 4, default: "0.0", comment: "佣金比例"
    t.string "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inviter_id"], name: "index_rally_users_on_inviter_id"
    t.index ["rally_id"], name: "index_rally_users_on_rally_id"
    t.index ["user_id"], name: "index_rally_users_on_user_id"
  end

  create_table "record_items", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "record_list_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "fields"
    t.index ["record_list_id"], name: "index_record_items_on_record_list_id"
  end

  create_table "record_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "data_list_id", scale: 4
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "parameters"
    t.jsonb "columns"
    t.index ["data_list_id"], name: "index_record_lists_on_data_list_id"
  end

  create_table "refunds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "order_id", scale: 8
    t.bigint "payment_id", scale: 8
    t.bigint "operator_id", scale: 8
    t.string "type"
    t.decimal "total_amount", limit: 2, precision: 10
    t.string "buyer_identifier"
    t.string "comment", scale: 512
    t.string "state", default: "0"
    t.datetime "refunded_at"
    t.string "reason", scale: 512
    t.string "currency"
    t.string "refund_uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "response"
    t.index ["operator_id"], name: "index_refunds_on_operator_id"
    t.index ["order_id"], name: "index_refunds_on_order_id"
    t.index ["payment_id"], name: "index_refunds_on_payment_id"
  end

  create_table "requirement_volunteers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "requirement_id", scale: 8
    t.bigint "volunteer_id", scale: 8
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_id"], name: "index_requirement_volunteers_on_requirement_id"
    t.index ["volunteer_id"], name: "index_requirement_volunteers_on_volunteer_id"
  end

  create_table "requirements", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "from"
    t.string "to"
    t.date "pick_on"
    t.time "pick_at"
    t.string "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", scale: 8
    t.bigint "volunteer_id", scale: 8
    t.string "state", default: "init"
    t.bigint "from_area_id", scale: 8
    t.bigint "to_area_id", scale: 8
    t.index ["from_area_id"], name: "index_requirements_on_from_area_id"
    t.index ["to_area_id"], name: "index_requirements_on_to_area_id"
    t.index ["user_id"], name: "index_requirements_on_user_id"
    t.index ["volunteer_id"], name: "index_requirements_on_volunteer_id"
  end

  create_table "resign_reasons", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.integer "position", scale: 4
    t.integer "resigns_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "resign_references", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "resign_id", scale: 8
    t.bigint "resign_reason_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resign_id"], name: "index_resign_references_on_resign_id"
    t.index ["resign_reason_id"], name: "index_resign_references_on_resign_reason_id"
  end

  create_table "resigns", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "reward_expenses", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "reward_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "aim_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aim_id"], name: "index_reward_expenses_on_aim_id"
    t.index ["reward_id"], name: "index_reward_expenses_on_reward_id"
    t.index ["user_id"], name: "index_reward_expenses_on_user_id"
  end

  create_table "reward_incomes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "reward_id", scale: 8
    t.bigint "user_id", scale: 8
    t.decimal "reward_amount", limit: 2, precision: 10, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reward_id"], name: "index_reward_incomes_on_reward_id"
    t.index ["user_id"], name: "index_reward_incomes_on_user_id"
  end

  create_table "rewards", id: { scale: 8 }, force: :cascade do |t|
    t.string "entity_type"
    t.bigint "entity_id", scale: 8
    t.decimal "min_piece", limit: 2, precision: 10, default: "1.0"
    t.decimal "max_piece", limit: 2, precision: 10, default: "10.0"
    t.decimal "amount", limit: 2, precision: 10
    t.decimal "income_amount", limit: 2, precision: 10
    t.decimal "expense_amount", limit: 2, precision: 10
    t.datetime "start_at"
    t.datetime "finish_at"
    t.boolean "enabled", default: true
    t.integer "lock_version", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_type", "entity_id"], name: "index_rewards_on_entity_type_and_entity_id"
  end

  create_table "role_rules", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "role_id", scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "controller_identifier"
    t.string "params_name"
    t.string "params_identifier"
    t.string "business_identifier"
    t.string "namespace_identifier"
    t.string "action_name"
  end

  create_table "role_types", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "role_id", scale: 8
    t.string "who_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_role_types_on_role_id"
  end

  create_table "roles", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "visible"
    t.string "who_types", array: true
    t.jsonb "role_hash", default: {}
    t.boolean "default"
  end

  create_table "rule_operations", id: { scale: 8 }, force: :cascade do |t|
    t.string "action_identifier"
    t.string "operation", default: "read"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rules", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "position", scale: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "identifier"
    t.string "namespace_identifier", default: "application"
    t.string "business_identifier"
    t.string "controller_identifier"
    t.string "action_name"
    t.string "operation", default: "read"
  end

  create_table "schedules", id: { scale: 8 }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seats", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "place_id", scale: 8
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "min_members", scale: 4, default: 1
    t.integer "max_members", scale: 4
    t.index ["place_id"], name: "index_seats_on_place_id"
  end

  create_table "serve_goods", id: { scale: 8 }, force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.bigint "serve_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_type", "good_id"], name: "index_serve_goods_on_good_type_and_good_id"
    t.index ["serve_id"], name: "index_serve_goods_on_serve_id"
  end

  create_table "shipments", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "package_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "shipping_type"
    t.bigint "shipping_id", scale: 8
    t.bigint "address_id", scale: 8
    t.string "state"
    t.index ["address_id"], name: "index_shipments_on_address_id"
    t.index ["package_id"], name: "index_shipments_on_package_id"
    t.index ["shipping_type", "shipping_id"], name: "index_shipments_on_shipping_type_and_shipping_id"
  end

  create_table "stars", id: { scale: 8 }, force: :cascade do |t|
    t.string "starred_type"
    t.bigint "starred_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["starred_type", "starred_id"], name: "index_stars_on_starred_type_and_starred_id"
    t.index ["user_id"], name: "index_stars_on_user_id"
  end

  create_table "stats", id: { scale: 8 }, force: :cascade do |t|
    t.integer "subscribed_requests_count", scale: 4
    t.integer "oauth_users_count", scale: 4
    t.integer "users_count", scale: 4
    t.integer "requirements_count", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
  end

  create_table "super_job_titles", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.string "description"
    t.integer "grade", scale: 4
    t.integer "cached_role_ids", scale: 4, array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_super_job_titles_on_organ_id"
  end

  create_table "supports", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "table_items", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "table_list_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fields", array: true
    t.index ["table_list_id"], name: "index_table_items_on_table_list_id"
  end

  create_table "table_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "taggeds", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "tag_id", scale: 4
    t.string "tagging_type"
    t.integer "tagging_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggeds_on_tag_id"
    t.index ["tagging_type", "tagging_id"], name: "index_taggeds_on_tagging_type_and_tagging_id"
  end

  create_table "tags", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.integer "taggeds_count", scale: 4, default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "task_template_hierarchies", id: { scale: 8 }, force: :cascade do |t|
    t.integer "ancestor_id", scale: 4, null: false
    t.integer "descendant_id", scale: 4, null: false
    t.integer "generations", scale: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ancestor_id", "descendant_id", "generations"], name: "task_template_anc_desc_idx", unique: true
    t.index ["descendant_id"], name: "task_template_desc_idx"
  end

  create_table "task_templates", id: { scale: 8 }, force: :cascade do |t|
    t.string "title"
    t.integer "parent_id", scale: 4
    t.integer "position", scale: 4, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_taxon_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "member_id", scale: 8
    t.jsonb "parent_ancestors"
    t.string "color"
    t.bigint "department_id", scale: 8
    t.index ["department_id"], name: "index_task_templates_on_department_id"
    t.index ["job_title_id"], name: "index_task_templates_on_job_title_id"
    t.index ["member_id"], name: "index_task_templates_on_member_id"
    t.index ["organ_id"], name: "index_task_templates_on_organ_id"
  end

  create_table "task_timers", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "task_id", scale: 4
    t.integer "duration", scale: 4
    t.datetime "finish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_task_timers_on_task_id"
  end

  create_table "tasks", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "title"
    t.integer "parent_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "0"
    t.string "focus", default: "0"
    t.string "repeat_type"
    t.integer "repeat_days", scale: 4, array: true
    t.integer "position", scale: 4, default: 1
    t.integer "estimated_time", scale: 4
    t.integer "actual_time", scale: 4
    t.datetime "done_at"
    t.integer "children_count", scale: 4, default: 0
    t.bigint "member_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "start_at"
    t.json "parent_ancestors"
    t.bigint "organ_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.bigint "project_id", scale: 8
    t.bigint "task_template_id", scale: 8
    t.string "note"
    t.bigint "department_id", scale: 8
    t.string "serial_number", comment: "Task Template test repeat"
    t.index ["department_id"], name: "index_tasks_on_department_id"
    t.index ["job_title_id"], name: "index_tasks_on_job_title_id"
    t.index ["member_id"], name: "index_tasks_on_member_id"
    t.index ["organ_id"], name: "index_tasks_on_organ_id"
    t.index ["task_template_id"], name: "index_tasks_on_task_template_id"
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

  create_table "taxon_items", id: { scale: 8 }, force: :cascade do |t|
    t.string "taxon_type"
    t.bigint "taxon_id", scale: 8
    t.bigint "list_id", scale: 8
    t.bigint "item_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "default_value"
    t.index ["item_id"], name: "index_taxon_items_on_item_id"
    t.index ["list_id"], name: "index_taxon_items_on_list_id"
    t.index ["taxon_type", "taxon_id"], name: "index_taxon_items_on_taxon_type_and_taxon_id"
  end

  create_table "taxons", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "team_members", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "team_id", scale: 4
    t.integer "job_title_id", scale: 4
    t.integer "member_id", scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_title_id"], name: "index_team_members_on_job_title_id"
    t.index ["member_id"], name: "index_team_members_on_member_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
  end

  create_table "teams", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name"
    t.string "teaming_type"
    t.integer "teaming_id", scale: 4
    t.string "description", scale: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organ_id", scale: 8
    t.index ["organ_id"], name: "index_teams_on_organ_id"
  end

  create_table "template_configs", id: { scale: 8 }, force: :cascade do |t|
    t.string "type"
    t.string "title"
    t.string "tid"
    t.string "description"
    t.string "notifiable_type"
    t.string "code", default: "default"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content"
  end

  create_table "template_key_words", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "template_config_id", scale: 8
    t.integer "position", scale: 4
    t.integer "kid", scale: 4
    t.string "name"
    t.string "example"
    t.string "rule"
    t.string "mapping"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["template_config_id"], name: "index_template_key_words_on_template_config_id"
  end

  create_table "time_items", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.integer "time_list_id", scale: 4
    t.time "start_at"
    t.time "finish_at"
    t.integer "position", scale: 4, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_list_id"], name: "index_time_items_on_time_list_id"
  end

  create_table "time_lists", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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

  create_table "total_carts", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.decimal "retail_price", default: "0.0", comment: "汇总：原价"
    t.decimal "discount_price", default: "0.0", comment: "汇总：优惠"
    t.decimal "bulk_price", default: "0.0"
    t.decimal "total_quantity", default: "0.0"
    t.integer "deposit_ratio", scale: 4, default: 100, comment: "最小预付比例"
    t.decimal "item_amount", limit: 2, precision: 10, default: "0.0"
    t.decimal "overall_additional_amount", limit: 2, precision: 10, default: "0.0"
    t.decimal "overall_reduced_amount", limit: 2, precision: 10, default: "0.0"
    t.decimal "total_additional_amount", default: "0.0"
    t.decimal "total_reduced_amount", default: "0.0"
    t.decimal "original_amount", default: "0.0", comment: "原价，应用优惠之前的价格"
    t.decimal "amount", limit: 2, precision: 10, default: "0.0"
    t.integer "trade_items_count", scale: 4, default: 0
    t.integer "lock_version", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "address_id", scale: 8
    t.index ["address_id"], name: "index_total_carts_on_address_id"
    t.index ["user_id"], name: "index_total_carts_on_user_id"
  end

  create_table "trade_items", id: { scale: 8 }, force: :cascade do |t|
    t.string "good_type"
    t.bigint "good_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number", scale: 4
    t.decimal "reduced_amount", limit: 2, precision: 10
    t.decimal "additional_amount", limit: 2, precision: 10
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
    t.bigint "address_id", scale: 8
    t.bigint "user_id", scale: 8
    t.bigint "produce_plan_id", scale: 8
    t.bigint "cart_id", scale: 8
    t.bigint "order_id", scale: 8
    t.index ["address_id"], name: "index_trade_items_on_address_id"
    t.index ["cart_id"], name: "index_trade_items_on_cart_id"
    t.index ["good_type", "good_id"], name: "index_trade_items_on_good_type_and_good_id"
    t.index ["order_id"], name: "index_trade_items_on_order_id"
    t.index ["produce_plan_id"], name: "index_trade_items_on_produce_plan_id"
    t.index ["user_id"], name: "index_trade_items_on_user_id"
  end

  create_table "trade_promotes", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "promote_id", scale: 8
    t.bigint "promote_charge_id", scale: 8
    t.decimal "amount", limit: 2, precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trade_item_id", scale: 8
    t.bigint "promote_good_id", scale: 8
    t.integer "sequence", scale: 4
    t.decimal "based_amount", limit: 2, precision: 10
    t.decimal "original_amount", limit: 2, precision: 10
    t.decimal "computed_amount", limit: 2, precision: 10
    t.string "note"
    t.bigint "promote_cart_id", scale: 8
    t.boolean "edited", comment: "是否被客服改过价"
    t.bigint "cart_id", scale: 8
    t.bigint "order_id", scale: 8
    t.bigint "user_id", scale: 8
    t.string "status", default: "init"
    t.index ["cart_id"], name: "index_trade_promotes_on_cart_id"
    t.index ["order_id"], name: "index_trade_promotes_on_order_id"
    t.index ["promote_cart_id"], name: "index_trade_promotes_on_promote_cart_id"
    t.index ["promote_charge_id"], name: "index_trade_promotes_on_promote_charge_id"
    t.index ["promote_good_id"], name: "index_trade_promotes_on_promote_good_id"
    t.index ["promote_id"], name: "index_trade_promotes_on_promote_id"
    t.index ["trade_item_id"], name: "index_trade_promotes_on_trade_item_id"
    t.index ["user_id"], name: "index_trade_promotes_on_user_id"
  end

  create_table "tutorials", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "user_annunciates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "annunciation_id", scale: 8
    t.bigint "user_tag_id", scale: 8
    t.integer "notifications_count", scale: 4, default: 0
    t.string "state"
    t.datetime "annunciated_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annunciation_id"], name: "index_user_annunciates_on_annunciation_id"
    t.index ["user_tag_id"], name: "index_user_annunciates_on_user_tag_id"
  end

  create_table "user_providers", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "provider_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_user_providers_on_provider_id"
    t.index ["user_id"], name: "index_user_providers_on_user_id"
  end

  create_table "user_taggeds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_tag_id", scale: 8
    t.bigint "user_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_taggeds_on_user_id"
    t.index ["user_tag_id"], name: "index_user_taggeds_on_user_tag_id"
  end

  create_table "user_tags", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.integer "user_taggeds_count", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_tagging_type"
    t.bigint "user_tagging_id", scale: 8
    t.index ["organ_id"], name: "index_user_tags_on_organ_id"
    t.index ["user_tagging_type", "user_tagging_id"], name: "index_user_tags_on_user_tagging"
  end

  create_table "users", id: { type: :serial, scale: 4 }, force: :cascade do |t|
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
    t.string "notifiable_types", default: [], array: true
    t.jsonb "counters", default: {}
    t.integer "showtime", scale: 4, default: 0
    t.boolean "accept_email", default: true
  end

  create_table "verifications", id: { scale: 8 }, force: :cascade do |t|
    t.string "verified_type"
    t.bigint "verified_id", scale: 8
    t.bigint "verifier_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.string "state"
    t.string "note"
    t.integer "position", scale: 4
    t.boolean "confirmed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_title_id"], name: "index_verifications_on_job_title_id"
    t.index ["member_id"], name: "index_verifications_on_member_id"
    t.index ["verified_type", "verified_id"], name: "index_verifications_on_verified"
    t.index ["verifier_id"], name: "index_verifications_on_verifier_id"
  end

  create_table "verifiers", id: { scale: 8 }, force: :cascade do |t|
    t.string "verifiable_type"
    t.bigint "verifiable_id", scale: 8
    t.bigint "member_id", scale: 8
    t.bigint "job_title_id", scale: 8
    t.string "name"
    t.integer "position", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_title_id"], name: "index_verifiers_on_job_title_id"
    t.index ["member_id"], name: "index_verifiers_on_member_id"
    t.index ["verifiable_type", "verifiable_id"], name: "index_verifiers_on_verifiable"
  end

  create_table "verify_tokens", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "volunteers", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.string "place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wait_items", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "user_id", scale: 8
    t.bigint "wait_list_id", scale: 8
    t.string "state"
    t.integer "position", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wait_items_on_user_id"
    t.index ["wait_list_id"], name: "index_wait_items_on_wait_list_id"
  end

  create_table "wait_lists", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "address_id", scale: 8
    t.bigint "wait_taxon_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "state"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.integer "wait_items_count", scale: 4, default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "wait_for_type"
    t.bigint "wait_for_id", scale: 8
    t.index ["address_id"], name: "index_wait_lists_on_address_id"
    t.index ["organ_id"], name: "index_wait_lists_on_organ_id"
    t.index ["wait_for_type", "wait_for_id"], name: "index_wait_lists_on_wait_for_type_and_wait_for_id"
    t.index ["wait_taxon_id"], name: "index_wait_lists_on_wait_taxon_id"
  end

  create_table "wait_taxons", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "organ_id", scale: 8
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organ_id"], name: "index_wait_taxons_on_organ_id"
  end

  create_table "wechat_agencies", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_platform_id", scale: 8
    t.string "appid"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "refresh_token"
    t.string "func_infos", array: true
    t.string "nick_name"
    t.string "head_img"
    t.string "user_name"
    t.string "principal_name"
    t.string "alias_name"
    t.string "qrcode_url"
    t.json "business_info"
    t.string "service_type"
    t.string "verify_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_platform_id"], name: "index_wechat_agencies_on_wechat_platform_id"
  end

  create_table "wechat_apps", id: { scale: 8 }, force: :cascade do |t|
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
    t.bigint "organ_id", scale: 8
    t.string "type"
    t.datetime "access_token_expires_at"
    t.datetime "jsapi_ticket_expires_at"
    t.string "mch_id"
    t.string "key"
    t.boolean "primary"
    t.string "oauth2_state"
    t.string "user_name"
    t.index ["organ_id"], name: "index_wechat_apps_on_organ_id"
  end

  create_table "wechat_auths", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_platform_id", scale: 8
    t.string "auth_code"
    t.datetime "auth_code_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "wechat_request_id", scale: 8
    t.boolean "testcase"
    t.index ["wechat_platform_id"], name: "index_wechat_auths_on_wechat_platform_id"
    t.index ["wechat_request_id"], name: "index_wechat_auths_on_wechat_request_id"
  end

  create_table "wechat_extractions", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_extractor_id", scale: 8
    t.string "name"
    t.string "matched"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "wechat_request_id", scale: 8
    t.integer "serial_number", scale: 4
    t.index ["wechat_extractor_id"], name: "index_wechat_extractions_on_wechat_extractor_id"
    t.index ["wechat_request_id"], name: "index_wechat_extractions_on_wechat_request_id"
  end

  create_table "wechat_extractors", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "prefix"
    t.string "suffix"
    t.boolean "more"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "serial"
    t.integer "serial_start", scale: 4
    t.time "start_at"
    t.time "finish_at"
    t.string "valid_response"
    t.string "invalid_response"
    t.bigint "wechat_response_id", scale: 8
    t.index ["wechat_response_id"], name: "index_wechat_extractors_on_wechat_response_id"
  end

  create_table "wechat_menus", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "parent_id", scale: 8
    t.string "type"
    t.string "menu_type"
    t.string "name"
    t.string "value"
    t.string "appid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position", scale: 4
    t.string "mp_appid"
    t.string "mp_pagepath"
    t.index ["parent_id"], name: "index_wechat_menus_on_parent_id"
  end

  create_table "wechat_notices", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_template_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "notification_id", scale: 8
    t.bigint "wechat_subscribed_id", scale: 8
    t.string "link", default: "index"
    t.string "msg_id"
    t.string "status"
    t.string "type"
    t.string "appid"
    t.string "open_id"
    t.index ["notification_id"], name: "index_wechat_notices_on_notification_id"
    t.index ["wechat_subscribed_id"], name: "index_wechat_notices_on_wechat_subscribed_id"
    t.index ["wechat_template_id"], name: "index_wechat_notices_on_wechat_template_id"
  end

  create_table "wechat_platforms", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "appid"
    t.string "secret"
    t.string "token"
    t.string "encoding_aes_key"
    t.string "verify_ticket"
    t.string "access_token"
    t.datetime "access_token_expires_at"
    t.string "pre_auth_code"
    t.datetime "pre_auth_code_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wechat_receiveds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_platform_id", scale: 8
    t.bigint "wechat_request_id", scale: 8
    t.string "appid"
    t.string "open_id"
    t.string "msg_id"
    t.string "msg_type"
    t.string "content"
    t.string "encrypt_data"
    t.json "message_hash"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appid"], name: "index_wechat_receiveds_on_appid"
    t.index ["open_id"], name: "index_wechat_receiveds_on_open_id"
    t.index ["wechat_platform_id"], name: "index_wechat_receiveds_on_wechat_platform_id"
    t.index ["wechat_request_id"], name: "index_wechat_receiveds_on_wechat_request_id"
  end

  create_table "wechat_registers", id: { scale: 8 }, force: :cascade do |t|
    t.string "id_name"
    t.string "id_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state", default: "init"
    t.string "appid"
    t.bigint "user_id", scale: 8
    t.bigint "organ_id", scale: 8
    t.string "email_code"
    t.string "password"
    t.string "mobile"
    t.string "mobile_code"
    t.index ["organ_id"], name: "index_wechat_registers_on_organ_id"
    t.index ["user_id"], name: "index_wechat_registers_on_user_id"
  end

  create_table "wechat_replies", id: { scale: 8 }, force: :cascade do |t|
    t.string "messaging_type"
    t.bigint "messaging_id", scale: 8
    t.string "type"
    t.string "value"
    t.json "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.string "description"
    t.string "appid"
    t.index ["messaging_type", "messaging_id"], name: "index_wechat_replies_on_messaging_type_and_messaging_id"
  end

  create_table "wechat_request_replies", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_request_id", scale: 8
    t.bigint "wechat_reply_id", scale: 8
    t.jsonb "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_reply_id"], name: "index_wechat_request_replies_on_wechat_reply_id"
    t.index ["wechat_request_id"], name: "index_wechat_request_replies_on_wechat_request_id"
  end

  create_table "wechat_requests", id: { scale: 8 }, force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.string "msg_type"
    t.string "event"
    t.string "event_key"
    t.jsonb "raw_body"
    t.bigint "wechat_reply_id", scale: 8
    t.string "appid"
    t.string "open_id"
    t.json "reply_body"
    t.string "reply_encrypt"
    t.index ["wechat_reply_id"], name: "index_wechat_requests_on_wechat_reply_id"
  end

  create_table "wechat_response_requests", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_response_id", scale: 8
    t.string "request_type", comment: "用户发送消息类型"
    t.string "appid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_response_id"], name: "index_wechat_response_requests_on_wechat_response_id"
  end

  create_table "wechat_responses", id: { scale: 8 }, force: :cascade do |t|
    t.string "match_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "expire_seconds", scale: 4
    t.string "qrcode_ticket"
    t.string "qrcode_url"
    t.datetime "expire_at"
    t.string "effective_type"
    t.bigint "effective_id", scale: 8
    t.boolean "contain", default: true
    t.string "request_types", array: true
    t.string "appid"
    t.index ["effective_type", "effective_id"], name: "index_wechat_responses_on_effective_type_and_effective_id"
  end

  create_table "wechat_services", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_request_id", scale: 8
    t.string "type"
    t.string "msgtype"
    t.string "value"
    t.string "appid"
    t.string "open_id"
    t.json "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_request_id"], name: "index_wechat_services_on_wechat_request_id"
  end

  create_table "wechat_subscribeds", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_user_id", scale: 8
    t.bigint "wechat_template_id", scale: 8
    t.datetime "sending_at"
    t.string "status", default: "accept"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wechat_template_id"], name: "index_wechat_subscribeds_on_wechat_template_id"
    t.index ["wechat_user_id"], name: "index_wechat_subscribeds_on_wechat_user_id"
  end

  create_table "wechat_tag_defaults", id: { scale: 8 }, force: :cascade do |t|
    t.string "name"
    t.string "default_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wechat_tags", id: { scale: 8 }, force: :cascade do |t|
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

  create_table "wechat_templates", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_app_id", scale: 8
    t.string "template_id"
    t.string "title"
    t.string "content"
    t.string "example"
    t.integer "template_type", scale: 4
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "template_config_id", scale: 8
    t.index ["template_config_id"], name: "index_wechat_templates_on_template_config_id"
    t.index ["wechat_app_id"], name: "index_wechat_templates_on_wechat_app_id"
  end

  create_table "wechat_tickets", id: { scale: 8 }, force: :cascade do |t|
    t.string "signature"
    t.integer "timestamp", scale: 4
    t.string "nonce"
    t.string "msg_signature"
    t.string "appid"
    t.string "ticket_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wechat_user_tags", id: { scale: 8 }, force: :cascade do |t|
    t.bigint "wechat_user_id", scale: 8
    t.bigint "wechat_tag_id", scale: 8
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_tagged_id", scale: 8
    t.index ["user_tagged_id"], name: "index_wechat_user_tags_on_user_tagged_id"
    t.index ["wechat_tag_id"], name: "index_wechat_user_tags_on_wechat_tag_id"
    t.index ["wechat_user_id"], name: "index_wechat_user_tags_on_wechat_user_id"
  end

  create_table "who_roles", id: { scale: 8 }, force: :cascade do |t|
    t.string "who_type"
    t.bigint "who_id", scale: 8
    t.bigint "role_id", scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_who_roles_on_role_id"
    t.index ["who_type", "who_id"], name: "index_who_roles_on_who_type_and_who_id"
  end

  create_table "whos", id: { type: :serial, scale: 4 }, force: :cascade do |t|
    t.string "name", null: false
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
