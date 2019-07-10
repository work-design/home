class AddAccessExpireAtToWechatConfigs < ActiveRecord::Migration[6.0]
  def change
    add_column :wechat_configs, :access_token_expires_at, :datetime
    add_column :wechat_configs, :jsapi_ticket_expires_at, :datetime
  end
end
