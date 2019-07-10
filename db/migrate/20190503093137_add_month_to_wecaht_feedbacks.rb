class AddMonthToWecahtFeedbacks < ActiveRecord::Migration[6.0]
  def change
    add_column :wechat_feedbacks, :month, :string
    add_column :wechat_feedbacks, :kind, :string
  end
end
