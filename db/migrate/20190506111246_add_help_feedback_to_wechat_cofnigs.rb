class AddHelpFeedbackToWechatCofnigs < ActiveRecord::Migration[6.0]
  def change
    add_column :wechat_configs, :help_feedback, :string
  end
end
