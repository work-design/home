class RefactorResponseFeedbacks < ActiveRecord::Migration[6.0]
  def change
    remove_columns :wechat_feedbacks, :kind, :month
    create_table :response_items do |t|
      t.references :wechat_response
      t.references :wechat_user
      t.datetime :respond_at
      t.date :respond_on
      t.string :respond_in
      t.integer :position, default: 1
      t.timestamps
    end
  end
end
