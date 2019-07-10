class AddRefreshCodeToAlipay < ActiveRecord::Migration[5.2]

  def change
    add_column :oauth_users, :auth_code, :string
    add_column :oauth_users, :app_auth_code, :string
    add_column :oauth_users, :app_auth_token, :string
    add_column :oauth_users, :app_refresh_token, :string
  end

end
