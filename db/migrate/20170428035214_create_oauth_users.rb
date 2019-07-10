class CreateOauthUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :oauth_users do |t|
      t.references :user
      t.string :provider
      t.string :uid
      t.string :name
      t.string :avatar_url
      t.timestamps
    end
  end
end

