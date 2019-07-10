class ChangeNullForWechatConfig < ActiveRecord::Migration[6.0]
  def change
    change_column_null :wechat_configs, :access_token, true
    change_column_null :wechat_configs, :jsapi_ticket, true
  end
end
