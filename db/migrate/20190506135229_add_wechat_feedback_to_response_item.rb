class AddWechatFeedbackToResponseItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :response_items, :wechat_feedback
  end
end
