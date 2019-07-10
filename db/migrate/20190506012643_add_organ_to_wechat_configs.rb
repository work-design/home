class AddOrganToWechatConfigs < ActiveRecord::Migration[6.0]
  def change
    add_reference :wechat_configs, :organ
  end
end
