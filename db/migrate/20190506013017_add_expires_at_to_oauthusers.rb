class AddExpiresAtToOauthusers < ActiveRecord::Migration[6.0]
  def change
    add_column :oauth_users, :expires_at, :datetime
  end
end
