class AddExpireSecondsToResponses < ActiveRecord::Migration[6.0]
  def change
    add_column :wechat_responses, :expire_seconds, :integer
    add_column :wechat_responses, :name, :string
    add_column :wechat_responses, :type, :string
    add_column :wechat_responses, :qrcode_ticket, :string
    add_column :wechat_responses, :qrcode_url, :string
    add_column :wechat_responses, :qrcode_expire_at, :datetime
    add_column :wechat_configs, :help_user_disabled, :string
    add_column :wechat_configs, :help_without_user, :string
    rename_column :wechat_responses, :regexp, :match_value
  end
end
