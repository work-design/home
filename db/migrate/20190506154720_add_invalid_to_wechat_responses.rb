class AddInvalidToWechatResponses < ActiveRecord::Migration[6.0]
  def change
    rename_column :wechat_responses, :response, :valid_response
    add_column :wechat_responses, :invalid_response, :string
  end
end
