class AddHelpToWechatConfigs < ActiveRecord::Migration[6.0]
  def change
    add_column :wechat_configs, :help, :string, limit: 1024
  end
end
