class AddAccessTokenToOauthUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :oauth_users, :access_token, :string
  end
end
