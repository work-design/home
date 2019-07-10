class AddOauthUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :oauth_users, :type, :string
  end
end
