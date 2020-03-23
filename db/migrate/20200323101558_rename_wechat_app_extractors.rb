class RenameWechatAppExtractors < ActiveRecord::Migration[6.0]
  def change
    rename_table :wechat_app_extractors, :wechat_response_extractors
    rename_column :wechat_response_extractors, :wechat_app_id, :wechat_response_id
  end
end
