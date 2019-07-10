class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :wechat_feedbacks do |t|
      t.references :wechat_user
      t.text :body
      t.integer :position, default: 1
      t.date :feedback_on
      t.timestamps
    end

  end
end
