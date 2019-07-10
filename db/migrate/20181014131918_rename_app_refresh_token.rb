class RenameAppRefreshToken < ActiveRecord::Migration[5.2]
  def change
    rename_column :oauth_users, :app_refresh_token, :refresh_token
  end
end
