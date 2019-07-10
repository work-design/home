class AddStartAtToResponse < ActiveRecord::Migration[6.0]
  def change
    add_column :wechat_responses, :start_at, :time
    add_column :wechat_responses, :finish_at, :time
  end
end
