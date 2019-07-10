class AddWechatConfigToWechatFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_reference :wechat_feedbacks, :wechat_config
  end
end
