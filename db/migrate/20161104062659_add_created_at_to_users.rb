class AddCreatedAtToUsers < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :users, null: true
    add_column :users, :auth_token_expired_at, :datetime
  end
end
