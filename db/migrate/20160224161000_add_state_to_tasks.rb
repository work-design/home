class AddStateToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :state, :integer, default: 0

    create_table :users do |t|
      t.string   "name"
      t.string   "email"
      t.string   "mobile"
      t.string   "password_digest"
      t.integer  "role_id"
      t.string   "mobile_code"
      t.datetime "mobile_code_expired_at"
      t.boolean  "mobile_confirm",        default: false
      t.string   "avatar"
      t.datetime "last_login_at"
      t.inet     "last_login_ip"
    end
  end
end
