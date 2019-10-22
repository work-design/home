class CreateAuthorizedTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :authorized_tokens do |t|
      t.references :user
      t.references :oauth_user
      t.references :account
      t.string :token
      t.datetime :expire_at
      t.string :session_key
      t.integer :access_counter, default: 0
      t.index [:user_id, :oauth_user_id, :account_id, :token], unique: true, name: 'index_authorized_tokens_on_unique_token'
      t.timestamps
    end
  end
end
